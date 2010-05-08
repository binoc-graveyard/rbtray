// ****************************************************************************
// 
// RBTray
// Copyright (C) 1998-2010  Nikolay Redko, J.D. Purcell
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// ****************************************************************************

#include <windows.h>
#include "rbtray.h"

static HHOOK hMouse = NULL;
static HHOOK hWndProc = NULL;
static HWND hLastHit = NULL;

LRESULT CALLBACK MouseProc(int nCode, WPARAM wParam, LPARAM lParam) {
	if (nCode >= 0 && (wParam == WM_NCRBUTTONDOWN || wParam == WM_NCRBUTTONUP)) {
		HWND window = ((MOUSEHOOKSTRUCT*)lParam)->hwnd;
		UINT hitTestCode = ((MOUSEHOOKSTRUCT*)lParam)->wHitTestCode;
		BOOL isHit = (hitTestCode == HTMINBUTTON);
		if (wParam == WM_NCRBUTTONDOWN) {
			hLastHit = isHit ? window : NULL;
		}
		else if (wParam == WM_NCRBUTTONUP && isHit && window == hLastHit) {
			PostMessage(FindWindow(NAME, NAME), WM_ADDTRAY, 0, (LPARAM)window);
		}
	}
	return CallNextHookEx(hMouse, nCode, wParam, lParam);
}

LRESULT CALLBACK LowLevelMouseProc(int nCode, WPARAM wParam, LPARAM lParam) {
	if (nCode >= 0 && (wParam == WM_RBUTTONDOWN || wParam == WM_RBUTTONUP)) {
		POINT point = ((MSLLHOOKSTRUCT*)lParam)->pt;
		HWND window = WindowFromPoint(point);
		UINT hitTestCode = window ? (UINT)SendMessage(window, WM_NCHITTEST, 0, MAKELPARAM(point.x, point.y)) : 0;
		BOOL isHit = (hitTestCode == HTMINBUTTON);
		if (wParam == WM_RBUTTONDOWN) {
			hLastHit = isHit ? window : NULL;
			if (isHit) return 1;
		}
		else if (wParam == WM_RBUTTONUP && isHit && window == hLastHit) {
			PostMessage(FindWindow(NAME, NAME), WM_ADDTRAY, 0, (LPARAM)window);
			return 1;
		}
	}
	return CallNextHookEx(hMouse, nCode, wParam, lParam);
}

LRESULT CALLBACK CallWndRetProc(int nCode, WPARAM wParam, LPARAM lParam) {
	if (nCode >= 0) {
		CWPRETSTRUCT *msg = (CWPRETSTRUCT*)lParam;
		if ((msg->message == WM_WINDOWPOSCHANGED && 
			(((WINDOWPOS*)msg->lParam)->flags & SWP_SHOWWINDOW) != 0) ||
			(msg->message == WM_NCDESTROY))
		{
			PostMessage(FindWindow(NAME, NAME), WM_REFRTRAY, 0, (LPARAM)msg->hwnd);
		}
	}
	return CallNextHookEx(hWndProc, nCode, wParam, lParam);
}

BOOL DLLIMPORT RegisterHook(HMODULE hLib) {
	BOOL aeroCapable = LOBYTE(LOWORD(GetVersion())) >= 6;
	hMouse = aeroCapable ?
		SetWindowsHookEx(WH_MOUSE_LL, (HOOKPROC)LowLevelMouseProc, hLib, 0) :
		SetWindowsHookEx(WH_MOUSE, (HOOKPROC)MouseProc, hLib, 0);
	hWndProc = SetWindowsHookEx(WH_CALLWNDPROCRET, (HOOKPROC)CallWndRetProc, hLib, 0);
	if (hMouse == NULL || hWndProc == NULL) {
		UnRegisterHook();
		return FALSE;
	}
	return TRUE;
}

void DLLIMPORT UnRegisterHook() {
	if (hMouse) {
		UnhookWindowsHookEx(hMouse);
		hMouse = NULL;
	}
	if (hWndProc) {
		UnhookWindowsHookEx(hWndProc);
		hWndProc = NULL;
	}
}
