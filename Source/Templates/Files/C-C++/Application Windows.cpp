#include <windows.h>

LRESULT CALLBACK WindowProcedure (HWND, UINT, WPARAM, LPARAM);

char szClassName[ ] = "WindowsApp";

int WINAPI WinMain (HINSTANCE hThisInstance,
                    HINSTANCE hPrevInstance,
                    LPSTR lpszArgument,
                    int nFunsterStil)

{
    HWND hwnd;           
    MSG messages;          
    WNDCLASSEX wincl;    


    wincl.hInstance = hThisInstance;
    wincl.lpszClassName = szClassName;
    wincl.lpfnWndProc = WindowProcedure;    
    wincl.style = CS_DBLCLKS;                
    wincl.cbSize = sizeof (WNDCLASSEX);


    wincl.hIcon = LoadIcon (NULL, IDI_APPLICATION);
    wincl.hIconSm = LoadIcon (NULL, IDI_APPLICATION);
    wincl.hCursor = LoadCursor (NULL, IDC_ARROW);
    wincl.lpszMenuName = NULL;              
    wincl.cbClsExtra = 0;                   
    wincl.cbWndExtra = 0;                

    wincl.hbrBackground = (HBRUSH) COLOR_BACKGROUND;


    if (!RegisterClassEx (&wincl))
        return 0;


    hwnd = CreateWindowEx (
           0,               
           szClassName,      
           "Windows App",    
           WS_OVERLAPPEDWINDOW, 
           CW_USEDEFAULT,  
           CW_USEDEFAULT,       
           544,              
           375,           
           HWND_DESKTOP,    
           NULL,              
           hThisInstance,     
           NULL                 
           );

    ShowWindow (hwnd, nFunsterStil);

    while (GetMessage (&messages, NULL, 0, 0))
    {
        TranslateMessage(&messages);
        DispatchMessage(&messages);
    }


    return messages.wParam;
}


LRESULT CALLBACK WindowProcedure (HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message)           
    {
        case WM_DESTROY:
            PostQuitMessage (0);  
            break;
        default:                     
            return DefWindowProc (hwnd, message, wParam, lParam);
    }

    return 0;
}