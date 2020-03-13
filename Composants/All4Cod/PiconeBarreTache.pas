unit PiconeBarreTache;
//http://www.phidels.com
//Version 2.23 du 23/09/03 : restitution des valeurs des événements d'origine
               //dans le destroy.
               //retrait d'un bug laissant de temps en temps la grande icone
               //visible alors que GrandeIconeVisible était à false
// Version 2.24 du 26/09/03 : Rajout de test dans le destroy pour éviter un bug
               //en D5 à la fermeture de d5 ou au retrait du composant
// Version 2.3 du 27/09/03  : Ajout par [SFX]-ZeuS de la détection d'un
              //redemarrage de l'Explorer permettant
              // à l'application de remettre son icone dans le Systray
// Version 2.4 du 5/10/03 : Ajout de lapossibilité de définir l'ordre de
              //défilement des icone (animation de la petite icone)
// Version 2.41 du 14 11 03 : retrait d'un bug qui arrivait lorsque l'on
              //essayait d'affecter un hint supérieur à 64 Octets
// Version 2.42 du 16/11/03 : Ajout de la procédure RegenerePetiteIcone.
              // et retiré le bug qui faisait que lorsque l'on mettait la fiche
              // à FsStayOnTop, la petite icone disparaissait.
// Version 2.43 du 20/02/04: retiré le fait que l'icone pouvait se déplacer
              //lorsque l'on fait un clic droit dessus.
// Version 2.44 du 10/04/2005 retiré le bug arrivnat si quelqu'un faisait un free
           //du popmenu attaché à ce composant (ajout de la procédurenotification)

{$IFNDEF VER130} { Delphi 5.0 }
  {$IFNDEF VER90} { Delphi 2.0 }
    {$IFNDEF VER100} { Delphi 3.0 }
      {$IFNDEF VER120} { Delphi 4.0 }
        {$DEFINE VER_D6OuPlus}  //pour pouvoir plus bas dans le code compiler
                                //différemment si on est en D6 ou plus
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Menus, extctrls, ShellAPI;


Const WM_MYMESSAGE=WM_USER+100; // numéro de message utilisé plus bas.

type ExceptionNumsImageLIstAffiche = class(Exception);

type
  // Seul un objet possédant un Handle peut recevoir les messages souris lorsque l'on
  // passe ou clique sur l'icone (affichage du Hint ou du menu pop)
  // C'est le cas d'un TWinControl mais pas d'un TComponent
  // On aurait pu dériver TPiconeBarreTache directement d'un TWinControl
  // et ainsi bénéficier par héritage d'un Handle
  // mais lorsque l'on pose le composant sur la fiche, un twinControl ne se voit pas (ou presque)
  // C'est le Handle de PourHandle de type TPourHandle qui sera donné à Windows comme devant recevoir les messages
  // ainsi, A chaque fois que Windows aura un message à emettre causé par le passage de la souris
  // au dessus de l'icone ou par un clique de souris sur l'icone, la procédure TrayMessage sera ainsi déclenchée.

  TPourHandle =class(TWinControl)
  private
    procedure TrayMessage(var Msg: TMessage); message WM_MYMESSAGE;
    // cette procédure sera déclenchée à chaque fois que Windows envera un message de type WM_MYMESSAGE
  end;

  TPiconeBarreTache = class(TComponent)
  private
    WM_TASKBARCREATED   : Longint; // Messages de créations de la barre des tache
    FMenuPop            : TPopupMenu;
    FReduireSiFin       : Boolean;
    FCacherSiMinimize   : Boolean;
    FGrandeIconeVisible : Boolean;
    FPetiteIconeVisible : Boolean;
    FApplicationCachee  : Boolean;
    FIcone              : TIcon;
    FHint               : string;
    NotifyStruc         : TNotifyIconData; // "structure" de l'icône
    PourHandle          : TPourHandle;// composant de type TWinControl uniquement pour se servir de son Handle
    PetiteIconeAffichee : Boolean;// indique en permanence si la petite icone est affichée
    DejaLoaded          : Boolean;
    FIconeFileName      : TFileName;//indique si on est déjà passé dans la procedure loaded
    TimerGrandeIconeBlink  : TTimer;
    TimerAnimationPetiteIcone : TTimer;
    FIntervalGrandeIconeBlink: Integer;
    FGrandeIconBlink: Boolean;
    FOnMouseUp          : TMouseEvent;
    FOnMouseDown        : TMouseEvent;
    FOnMouseMove        : TMouseMoveEvent;
    FOuvreSiClicGauche  : Boolean;
    FImageList          : TImageList;
    FIntervalAnimation  : Integer;
    FAnimation          : Boolean;
    FNumIconeAfficheImageList: Integer;
    FNumIconeImageList: Integer;
    FOnDblClick: TNotifyEvent;
    FOuvreSiDblClick       : Boolean;
    FMenuSiClicGauche      : Boolean;
    FMenuSiClicDroit       : Boolean;
    FOrdreImageListAffiche  : String;  // contient le n° des images à faire défiler (ex : 1,2,4,5)
    NbNumOrdreImageListAffiche : Integer; // nombre de n° d'image contenu dans FOrdreImageListAffiche
    NumImageListAffiche    : Integer; // contient le n ieme de FOrdreImageListAffiche correspondant à l'imge affiché
    procedure TimerBigIconeOnTimer(Sender: TObject);
    procedure TimerAnimationPetiteIconeOnTimer(Sender: TObject);
    procedure SetReduireSiFin(const Value: Boolean);
    procedure SetGrandeIconeVisible(const Value: Boolean);
    procedure SetPetiteIconeVisible(const Value: Boolean);
    procedure SetApplicationCachee(const Value: Boolean);
    procedure SetIcone(const Value: TIcon);
    procedure SetHint(const Value: string);
    procedure SetIconeFileName(const Value: TFileName);
    procedure SetIntervalGrandeIconeBlink(const Value: Integer);// interval de temps pour clignotement
    procedure SetGrandeIconBlink(const Value: Boolean);
    procedure SetAnimation(const Value: Boolean);
    procedure SetIntervalAnimation(const Value: Integer);
    procedure SetNumIconeAfficheImageList(const Value: Integer);
    procedure SetNumIconeImageList(const Value: Integer);
    procedure SetOrdreImageListAffiche(const Value: String);
  protected
    PApplicationOldWndProc            : Longint; // Pointer sur Application.WndProc d'origine
    PObjectInstanceApplicationWndProc : Longint;
    FormAOwner:TForm;
    FormOldClose             :TCloseEvent;
    ApplicationOldActivate   :TNotifyEvent;
    ApplicationOldOnMinimize :TNotifyEvent;
    EtatFsStayOnTop:TFormStyle;// pour pouvoir controler quand la fiche change de FormStyle
    procedure LaFormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationActivate(Sender: TObject);
    procedure ApplicationMinimize(Sender: TObject);
    procedure loaded; override;
    procedure ApplicationWndProc(var Message: TMessage);
  public
    procedure CacherApplication;
    procedure MontrerApplication;
    //n° dans la liste de l'icone qui est affichée. (change au cours de l'animation)
    Property NumIconeAfficheImageList : Integer read FNumIconeAfficheImageList write SetNumIconeAfficheImageList;
    Constructor Create(AOwner:TComponent); override;
    destructor destroy; override;
    procedure RegenerePetiteIcone;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  published
    Property MenuPop:TPopupMenu read FMenuPop write FMenuPop;
    Property ReduireSiFin      : Boolean    read FReduireSiFin       write SetReduireSiFin;
    Property CacherSiMinimize  : Boolean    read FCacherSiMinimize   write FCacherSiMinimize;
    Property PetiteIconeVisible: Boolean    read FPetiteIconeVisible write SetPetiteIconeVisible;
    Property GrandeIconeVisible: Boolean    read FGrandeIconeVisible write SetGrandeIconeVisible;
    Property ApplicationCachee : Boolean    read FApplicationCachee  write SetApplicationCachee;
    Property IconeFileName     : TFileName  read FIconeFileName      write SetIconeFileName;
    Property Icone             : TIcon      read FIcone write SetIcone;
    Property ImageList         : TImageList read FImageList write FImageList;
    property OrdreImageListAffiche : String read FOrdreImageListAffiche write SetOrdreImageListAffiche;
    Property IntervalAnimation :Integer     read FIntervalAnimation write SetIntervalAnimation;
    Property Animation         : Boolean    read FAnimation write SetAnimation;
    //N° de l'icone que l'utilisateur veut voir afficher. Ne change pas au cours de l'animation.
    Property NumIconeImageList : Integer    read FNumIconeImageList write SetNumIconeImageList;
    Property Hint              : string     read FHint  write SetHint;
    Property GrandeIconBlink   : Boolean    read FGrandeIconBlink write SetGrandeIconBlink; // clignotement grande Icone
    Property IntervalGrandeIconeBlink:Integer read FIntervalGrandeIconeBlink write SetIntervalGrandeIconeBlink;
    Property OuvreSiClicGauche : Boolean   read FOuvreSiClicGauche write FOuvreSiClicGauche;
    Property OuvreSiDblClick   : Boolean   read FOuvreSiDblClick  write FOuvreSiDblClick;
    Property MenuSiClicDroit   : Boolean   read FMenuSiClicDroit  write FMenuSiClicDroit;// ouvre menu si clic droit
    Property MenuSiClicGauche  : Boolean   read FMenuSiClicGauche write FMenuSiClicGauche;// ouvre menu si clic gauche
    property OnMouseUp   : TMouseEvent     read FOnMouseUp   write FOnMouseUp;
    property OnMouseDown : TMouseEvent     read FOnMouseDown write FOnMouseDown;
    property OnMouseMove : TMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    property OnDblClick  : TNotifyEvent    read FOnDblClick  write FOnDblClick;

  end;

// déclaration pour l'utilisation de l'PAI  FlashWindowEx
FLASHWINFO = record
  cbSize: UINT;
  hwnd: HWND;
  dwFlags: DWORD;
  uCount: UINT;
  dwTimeout: DWORD;
end;



procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Phidels', [TPiconeBarreTache]);
end;

procedure TPiconeBarreTache.Notification(AComponent: TComponent; Operation: TOperation);
begin
      inherited Notification(AComponent, Operation);
      if Operation = opRemove then
      begin
          if AComponent = FMenuPop   then MenuPop   := nil;
          if AComponent = FImageList then ImageList := nil;
      end;
end;

procedure StopFlash;
{ arrète le clignotement de la grande icone }
{ FlashWindow fonctionne mal en XP mais FlashWindowEx ne fonctionne pas 'd'après l'aide en Win 95}
var pfwi: FLASHWINFO;
    hdll : HMODULE;
    FlashWindowEx: function(var pfwi: FLASHWINFO): BOOL; stdcall;
begin
  hDLL:=LoadLibrary('user32.dll'); // chargement de la dll
  if hDLL<>0 then
  begin
// affectation de la fonction somme de la dll à la fonction somme de notre programme
    @FlashWindowEx:=GetProcAddress(hDLL,'FlashWindowEx');
    if @FlashWindowEx<>nil then
    begin
      pfwi.cbSize:=sizeof(pfwi);
      pfwi.hwnd:=application.handle;
      pfwi.dwFlags:=FLASHW_STOP;
      pfwi.uCount:=0;
      FlashWindowEx(pfwi);
    end
    else FlashWindow(application.handle, False); // Win 95 ne connait pas FlashWindowEx
    FreeLibrary(hDLL);//libération. La Dll n'est plus utilisable
  end
  else FlashWindow(application.handle, False);
end;

Constructor TPiconeBarreTache.Create(AOwner:TComponent);
begin
  FIcone:=TIcon.create;
  PourHandle:=TPourHandle.Create(self);
  PourHandle.Parent:=TWinControl(AOwner); // en réalité AOwner est la fiche sur laquelle on a posé le composant.
  PetiteIconeAffichee:=false;
  DejaLoaded:=false;
  TimerGrandeIconeBlink:=TTimer.Create(Self);
  TimerGrandeIconeBlink.Enabled:=false;
  TimerGrandeIconeBlink.OnTimer:=TimerBigIconeOnTimer;
  TimerAnimationPetiteIcone:= TTimer.Create(Self);
  TimerAnimationPetiteIcone.Enabled:=false;
  TimerAnimationPetiteIcone.OnTimer:=TimerAnimationPetiteIconeOnTimer;
  Inherited;
  if (csDesigning in ComponentState) then // si on est en mode conception
  begin
    FOuvreSiClicGauche  :=True;
    FMenuSiClicDroit    :=True;
    FMenuSiClicGauche   :=False;
    FReduireSiFin       :=False;
    FPetiteIconeVisible :=True;
    FGrandeIconeVisible :=True;
    FApplicationCachee  :=False;
    FOuvreSiDblClick    :=False;
    FCacherSiMinimize   :=False;
    FIntervalGrandeIconeBlink:=1000;//interval pour clignotement grande icone
    FGrandeIconBlink:=False;// Clignotement inactif
    FIntervalAnimation:=1000;
    FImageList:=nil;
    FNumIconeAfficheImageList:=0;
    FAnimation:=False;
  end
  else //si on est pas en mode conception
  begin
    FIcone.Assign(Application.Icon);
    FormAOwner:=TForm(AOwner);// la forme propriétaire de notre composant
    FormOldClose          :=FormAOwner.OnClose; //on mémorise le OnClose d'origine de façon à pouvoir le déclencher lorsqu'on le désirera
    FormAOwner.OnClose    :=LaFormClose; // on redirige l'événement OnClose vers LaFormShow
    ApplicationOldActivate:= Application.OnActivate;// on mémorise le OnActivate d'origine
    Application.OnActivate:=ApplicationActivate;// on redirige l'événement OnActivate de l'application
    ApplicationOldOnMinimize:=Application.OnMinimize;// idem mais pour OnMinimize
    Application.OnMinimize:=ApplicationMinimize;

    WM_TASKBARCREATED:=RegisterWindowMessage('TaskbarCreated'); // demande l'enregistement du message de création de la barre des taches
    PApplicationOldWndProc := GetWindowLong(Application.Handle, GWL_WNDPROC); //On mémorise Application.WndProc


    {$IFDEF VER_D6OuPlus}
      PObjectInstanceApplicationWndProc := LongInt(Classes.MakeObjectInstance(ApplicationWndProc));
    {$ELSE}
      PObjectInstanceApplicationWndProc := LongInt(MakeObjectInstance(ApplicationWndProc));
     {$ENDIF}

    // remplacement de l'ancien WndProc par le notre (ApplicationWndProc)
    SetWindowLong(Application.Handle, GWL_WNDPROC, PObjectInstanceApplicationWndProc);
  end;
end;

procedure TPiconeBarreTache.RegenerePetiteIcone;
{place l'icone dans la barre des tâches.                                                    }
{est appelé au départ par la procédure loaded et peut être appelé lorsque l'icone a disparu }
{ suite à un FsStayOntop de la Form                                                         }
begin
  if not(csDesigning in ComponentState) then // si on est pas en mode conception
  begin
    notifyStruc.cbSize:=SizeOf(NotifyStruc);
    notifyStruc.Wnd:=PourHandle.Handle;
    notifyStruc.uID:=1;
    NotifyStruc.uFlags := NIF_ICON or NIF_TIP or NIF_MESSAGE;
    NotifyStruc.uCallbackMessage := WM_MYMESSAGE;
    // choix de l'icone à afficher
    NotifyStruc.hIcon :=Ficone.Handle;
   // DejaLoaded:=true;
    if PetiteIconeVisible then
    begin
      Shell_NotifyIcon(NIM_ADD,@NotifyStruc);//ajoute la petite icône dans la barre des taches
      PetiteIconeAffichee:=true;
    end;
  end;
end;

procedure TPiconeBarreTache.loaded;
//loaded est appelée automatiquement par Delphi lorsque tous les créate ont eu lieu
begin
  inherited;
  if not(csDesigning in ComponentState) then
  begin
    EtatFsStayOnTop:=FormAOwner.FormStyle;
    RegenerePetiteIcone;
    DejaLoaded:=true;
    { permet l'affichage de l'icone de la liste qu'a choisi l'utilisateur si la liste existe}
    { ne peut être mis dans le create car trop tôt}
    NumIconeAfficheImageList:=FNumIconeImageList;
  end;
end;


procedure TPiconeBarreTache.ApplicationActivate(Sender: TObject);
{on a redirigé l'évènement application.onActivate vers cette procédure    }
{ car le ShowWindow ci dessous ne peut être fait dans le loaded (trop tot)}
begin
  if not(csDesigning in ComponentState) then // si on est en mode exécution
  begin
    if assigned(ApplicationOldActivate)then ApplicationOldActivate(Sender);
    if not FGrandeIconeVisible then  ShowWindow(Application.Handle, SW_HIDE); // retirer la grande icône de la barre des tâches
  end;
end;


procedure TPiconeBarreTache.LaFormClose(Sender: TObject; var Action: TCloseAction);
// procédure appelée à chaque form.close (détournement)
begin
  if assigned(FormOldClose)then FormOldClose(Sender,Action);
  if FReduireSiFin then
  begin
    ShowWindow(Application.Handle, SW_HIDE); // retirer la grande icône de la barre des tâches
    FormAOwner.Visible:=false; //cacher la fiche
    Action:=caNone;
  end;
end;


procedure TPiconeBarreTache.ApplicationWndProc(var Message: TMessage);
begin
// s'il y a eu création d'une nouvelle taskbarre on recharge la petite icone
  if Longint(Message.Msg) = WM_TASKBARCREATED then RegenerePetiteIcone;//loaded;

///////// il faut regénérer l'icone si on a mis la fiche en FsStayOnTop ////////
  if (Longint(Message.Msg) =WM_WINDOWPOSCHANGING) and  PetiteIconeAffichee
  and  (EtatFsStayOnTop<>FormAOwner.FormStyle) then
  begin
    Shell_NotifyIcon(NIM_DELETE,@NotifyStruc);//retire la petite icône de la barre des taches
      //si on ne le fait pas, on peut se retrouver avec 2 icones dont une qui s'efface lorsque
      //l'on passe la souris dessus;
  end;
// puis on fait suivre le message à l'application.
  Message.Result := CallWindowProc(Pointer(PApplicationOldWndProc), Application.Handle,
                                         Message.Msg, Message.wParam, Message.lParam);
  if (Longint(Message.Msg) =WM_WINDOWPOSCHANGING) and  PetiteIconeAffichee
  and  (EtatFsStayOnTop<>FormAOwner.FormStyle) then
  begin
     RegenerePetiteIcone;// il faut regénérer l'icone si on a mis la fiche en FsStayOnTop
     EtatFsStayOnTop:=FormAOwner.FormStyle;// on mémorise le nouvel état afin de pouvoir voir lorsqu'il change
  end;
end;


Destructor TPiconeBarreTache.Destroy;
begin
  if PetiteIconeAffichee then
  begin
    Shell_NotifyIcon(NIM_DELETE,@NotifyStruc);//retire la petite icône de la barre des taches;
    PetiteIconeAffichee:=false;
  end;
  FIcone.Free;  FIcone:=nil;
  // on ne met pas de PourHandle.free car son Owner est la fiche sur laquelle le composant est placé.
  // ainsi, PourHandle sera détruit lorsque la fiche le sera.
  if not(csDesigning in ComponentState) then // si on est pas en mode conception
  begin
    if FormAOwner<>nil then FormAOwner.OnClose :=  FormOldClose ;// on restitue les valeurs d'origine
    Application.OnActivate := ApplicationOldActivate ;  // on restitue le OnActivate d'origine
    Application.OnMinimize := ApplicationOldOnMinimize;// idem mais pour OnMinimize

    // avant de détruire le composant, on "rebranche" le WndProc de l'application comme à l'origine
    if PApplicationOldWndProc<>0 then SetWindowLong(Application.Handle, GWL_WNDPROC, LongInt(PApplicationOldWndProc)); // redonne la main à l'application pour les messages entrant
  {$IFDEF VER_D6OuPlus}
    if PObjectInstanceApplicationWndProc<>0 then classes.FreeObjectInstance(Pointer(PObjectInstanceApplicationWndProc));
  {$ELSE}
    if PObjectInstanceApplicationWndProc<>0 then FreeObjectInstance(Pointer(PObjectInstanceApplicationWndProc));
  {$ENDIF}
    PApplicationOldWndProc := 0;
    PObjectInstanceApplicationWndProc := 0;
  end;
  Inherited ;
end;



procedure TPIconeBarreTache.CacherApplication;
begin
  ShowWindow(Application.Handle, SW_HIDE); // retirer la grande icône de la barre des tâches
  if Application.MainForm<>nil then
  begin
    Application.MainForm.Visible:=false;
  end
  else Application.ShowMainForm :=false;// en fait le programme est en cours d'ouverture
end;

procedure TPIconeBarreTache.MontrerApplication;
begin
  if Application.MainForm<>nil then
  begin
    Application.Restore;
    Application.MainForm.Visible:=true;
    Application.MainForm.Refresh; 
    SetGrandeIconeVisible(FGrandeIconeVisible);//remet la grande icone visible
              //si la propriété GrandeIconeVisible est à true.
    SetForegroundWindow(Application.MainForm.Handle);
  end;
end;

procedure TPiconeBarreTache.ApplicationMinimize(Sender: TObject);
{procedure déclenchée à chaque fois que l'application se minimize}
{ c'est un détournement de application.OnMinimize                }
begin
  if assigned(ApplicationOldOnMinimize) then ApplicationOldOnMinimize(Sender);
  if CacherSiMinimize then ShowWindow(Application.Handle, SW_HIDE); // retirer la grande icône de la barre des tâches
end;


procedure TPourHandle.TrayMessage(var Msg: TMessage);// message WM_MYMESSAGE;
{cette procédure est déclenchée à chaque fois que la souris est sur l'icone ou
 à chaque fois que l'on clique sur l'icone}
var
  Coordonnes_souris :TPoint;
begin
  GetCursorPos(Coordonnes_souris);//récupération de la position de la souris
  // déclenchement des événements souris
  // Owner est en réalité le TPIconeBarreTache
  Case Msg.LParam of
     WM_RBUTTONDOWN : if Assigned(TPiconeBarreTache(Owner).FOnMouseDown) then
                        TPiconeBarreTache(Owner).FOnMouseDown(Owner, mbRight,
                        [ssRight] , Coordonnes_souris.X, Coordonnes_souris.y);
     WM_LBUTTONDOWN : if Assigned(TPiconeBarreTache(Owner).FOnMouseDown) then
                        TPiconeBarreTache(Owner).FOnMouseDown(Owner, mbLeft,
                        [ssLeft] , Coordonnes_souris.X, Coordonnes_souris.y);
     WM_MBUTTONDOWN : if Assigned(TPiconeBarreTache(Owner).FOnMouseDown) then
                        TPiconeBarreTache(Owner).FOnMouseDown(Owner, mbMiddle,
                        [ssMiddle] , Coordonnes_souris.X, Coordonnes_souris.y);
     WM_RBUTTONUP   : if Assigned(TPiconeBarreTache(Owner).FOnMouseUp) then
                        TPiconeBarreTache(Owner).FOnMouseUp(Owner, mbRight,
                        [ssRight] , Coordonnes_souris.X, Coordonnes_souris.y);
     WM_LBUTTONUP   : if Assigned(TPiconeBarreTache(Owner).FOnMouseUp) then
                        TPiconeBarreTache(Owner).FOnMouseUp(Owner, mbLeft,
                        [ssLeft] , Coordonnes_souris.X, Coordonnes_souris.y);
     WM_MBUTTONUP   : if Assigned(TPiconeBarreTache(Owner).FOnMouseUp) then
                        TPiconeBarreTache(Owner).FOnMouseUp(Owner, mbMiddle,
                        [ssMiddle] , Coordonnes_souris.X, Coordonnes_souris.y);
     WM_MOUSEMOVE   : if Assigned(TPiconeBarreTache(Owner).FOnMouseMove) then
                        TPiconeBarreTache(Owner).FOnMouseMove(Owner,
                        [ssLeft] , Coordonnes_souris.X, Coordonnes_souris.y);
     WM_LBUTTONDBLCLK : if Assigned(TPiconeBarreTache(Owner).FOnDblClick) then
                        TPiconeBarreTache(Owner).FOnDblClick(Owner);  
  end;
  if (Msg.LParam=WM_LBUTTONDOWN) and (TPiconeBarreTache(Owner).FOuvreSiClicGauche) then TPiconeBarreTache(Owner).ApplicationCachee:=False;
  if (Msg.LParam=WM_LBUTTONDBLCLK) and (TPiconeBarreTache(Owner).FOuvreSiDblClick) then TPiconeBarreTache(Owner).ApplicationCachee:=False;


  if ((Msg.LParam=WM_RBUTTONDOWN) and TPiconeBarreTache(Owner).FMenuSiClicDroit and Assigned(TPiconeBarreTache(Owner).MenuPop))
    or ((Msg.LParam=WM_LBUTTONDOWN) and TPiconeBarreTache(Owner).FMenuSiClicGauche and Assigned(TPiconeBarreTache(Owner).MenuPop))
  then
  begin
      SetForegroundWindow(Application.Handle);
      Application.ProcessMessages;
      TPiconeBarreTache(Owner).MenuPop.Popup(coordonnes_souris.x,coordonnes_souris.y); //affichage du menu  }
  end;
end;


procedure TPiconeBarreTache.SetReduireSiFin(const Value: Boolean);
begin
  FReduireSiFin := Value;
end;

procedure TPiconeBarreTache.SetGrandeIconeVisible(const Value: Boolean);
begin
  FGrandeIconeVisible := Value;
  if not(csDesigning in ComponentState) then // si on est en mode execution
  begin
    if FGrandeIconeVisible then  ShowWindow(Application.Handle, SW_SHOW)// affiche la grande icone de la barre des taches
    else  ShowWindow(Application.Handle, SW_HIDE); // retirer la grande icône de la barre des tâches
  end;
end;

procedure TPiconeBarreTache.SetPetiteIconeVisible(const Value: Boolean);
begin
  if FPetiteIconeVisible<>Value then // si ça a changé
  begin
    FPetiteIconeVisible := Value;
    if not(csDesigning in ComponentState)and DejaLoaded then // si on est en mode execution
    begin
      if  FPetiteIconeVisible and not PetiteIconeAffichee then
      begin
        notifyStruc.cbSize:=SizeOf(notifyStruc);
        notifyStruc.Wnd:=PourHandle.Handle;
        notifyStruc.uID:=1;
        NotifyStruc.uFlags := NIF_ICON or NIF_TIP or NIF_MESSAGE;
        NotifyStruc.uCallbackMessage := WM_MYMESSAGE;
        NotifyStruc.hIcon :=  FIcone.Handle;
        Shell_NotifyIcon(NIM_ADD,@NotifyStruc);//ajoute la petite icône dans la barre des taches
        PetiteIconeAffichee:=true;
      end
      else
      begin
        if PetiteIconeAffichee then Shell_NotifyIcon(NIM_DELETE,@NotifyStruc);
        PetiteIconeAffichee:=false;
      end;
    end;//fin si on est en mode exécution
  end; // fin si ça a changé
end;

procedure TPiconeBarreTache.SetApplicationCachee(const Value: Boolean);
{ détermine si l'application est cachée ou non }
begin
  FApplicationCachee := Value;
// si on est en mode execution
  if not(csDesigning in ComponentState) then
  begin
    if FApplicationCachee then CacherApplication
    else MontrerApplication;
  end;
end;

procedure TPiconeBarreTache.SetIcone(const Value: TIcon);
begin
  FIcone.Assign(Value);
 if not(csDesigning in ComponentState) then // si on est en mode execution
  begin
    if assigned(Ficone) then NotifyStruc.hIcon :=Ficone.Handle
      else NotifyStruc.hIcon :=application.Icon.Handle;
    if PetiteIconeAffichee then Shell_NotifyIcon(NIM_MODIFY,@NotifyStruc);
  end;
end;



procedure TPiconeBarreTache.SetHint(const Value: string);
var j,Len:integer;
begin
  FHint := Value;
  Len := Length(Value);
  if Len>=Length(NotifyStruc.szTip) then Len := Length(NotifyStruc.szTip)-1;
  if not(csDesigning in ComponentState) then // si on est en mode execution
  begin
     for j:=0 to Len-1 do NotifyStruc.szTip[j] := FHint[j+1];
     NotifyStruc.szTip[Len]:=#0;
     if PetiteIconeAffichee then Shell_NotifyIcon(NIM_MODIFY,@NotifyStruc);
  end;
end;



procedure TPiconeBarreTache.SetIconeFileName(const Value: TFileName);
  var UneIcone:TIcon;
begin
  FIconeFileName := Value;
  if not(csDesigning in ComponentState) then // si on est en mode execution
  begin
    if FIconeFileName<>'' then
    begin
      UneIcone:=TIcon.Create;
      try
        UneIcone.LoadFromFile(FIconeFileName);
        Icone:=UneIcone;
      Finally
        UneIcone.Free;
      end;
    end;
  end;// fin si on est en mode execution
end;


{=============================================================}
{partie de code concernant le clignotement de la grande icone }
{=============================================================}

procedure TPiconeBarreTache.TimerBigIconeOnTimer(Sender: TObject);
begin
  FlashWindow(application.handle, True);// fait passer d'un état à un autre
end;

procedure TPiconeBarreTache.SetIntervalGrandeIconeBlink(
  const Value: Integer);
{détermine la fréquence du clignotement}
begin
  FIntervalGrandeIconeBlink := Value;
  TimerGrandeIconeBlink.Interval:= FIntervalGrandeIconeBlink;
end;

procedure TPiconeBarreTache.SetGrandeIconBlink(const Value: Boolean);
{détermine si la grande icone doit clignoter }
begin
  FGrandeIconBlink := Value;
  if not(csDesigning in ComponentState) then
  begin
     TimerGrandeIconeBlink.Enabled:= FGrandeIconBlink;
     //if not FGrandeIconBlink then FlashWindow(application.handle, False);
     if not FGrandeIconBlink then StopFlash;
  end;
end;




{========================================================}
{partie de code concernant l'animation de la petite icone }
{ et l'affichage à partir de ImageList                   }
{========================================================}

procedure TPiconeBarreTache.SetNumIconeAfficheImageList(const Value: Integer);
{Affiche une icone à partir de ImageList }
  var IconeTemp:Ticon;
begin
  FNumIconeAfficheImageList := Value;
  if assigned(FImageList) then
  begin
    if FNumIconeAfficheImageList in [0..FImageList.count-1] then
    begin
      IconeTemp:=TIcon.create;
      try
        FImageList.GetIcon(FNumIconeAfficheImageList,IconeTemp);
        Icone:=IconeTemp;
      Finally
        IconeTemp.free;
      end;
    end;
  end;
end;


function GaucheNDroite(substr: string; s: string;n:integer): string;
{==============================================================================}
{ renvoie ce qui est à gauche de la droite de la n ieme sous chaine substr     }
{ de la chaine S                                                               }
{ ex : GaucheNDroite('/','c:machin\truc\essai.exe',1) renvoie 'truc'           }
{ Permet d'extraire un à un les éléments d'une chaine séparés par un séparateur}
{==============================================================================}
var i:integer;
begin
  S:=S+substr;
  for i:=1 to n do
  begin
    S:=copy(s, pos(substr, s)+length(substr), length(s)-pos(substr, s)+length(substr));
  end;
  result:=copy(s, 1, pos(substr, s)-1);
end;


procedure TPiconeBarreTache.TimerAnimationPetiteIconeOnTimer(
  Sender: TObject);
{gère l'animation en faisant successivement passer les icones les unes après les autres}
begin
  if assigned(FImageList) then
  begin
    if  NbNumOrdreImageListAffiche=0 then // alors on prend les images de FImageList dans l'ordre où elles y sont stockées
    begin
      if FImageList.count<>0 then
      begin
        if FNumIconeAfficheImageList<FImageList.Count-1 then
           NumIconeAfficheImageList:=FNumIconeAfficheImageList+1
        else NumIconeAfficheImageList:=0;
      end;
    end
    else // si NbNumsImageListAffiche est différent de 0 alors on ne prend que les imges décrites par NumsImageListAffiche

    begin
      if FImageList.count<>0 then
      begin
        // on parcourt chacun leur tour les n° contenu dans  NumsImageListAffiche
        //  NumImageListAffiche contient le rang dans NumsImageListAffiche du n° de l'image contenu dans la liste à afficher
        NumImageListAffiche:=NumImageListAffiche+1;
        if NumImageListAffiche >NbNumOrdreImageListAffiche-1 then NumImageListAffiche:=0;
        NumIconeAfficheImageList:=StrToIntDef(GaucheNDroite(',',OrdreImageListAffiche,NumImageListAffiche),0);
        if NumIconeAfficheImageList>=FImageList.Count-1 then NumIconeAfficheImageList:=FImageList.Count-1;
      end;
    end;
  end;
end;

procedure TPiconeBarreTache.SetAnimation(const Value: Boolean);
{Détermine si l'animation doit se faire ou non}
begin
  FAnimation := Value;
  if not(csDesigning in ComponentState) then
  begin
    TimerAnimationPetiteIcone.Enabled:=FAnimation;
    if not FAnimation then NumIconeAfficheImageList:=NumIconeImageList;// remise à 0 de l'animation
  end;
end;

procedure TPiconeBarreTache.SetIntervalAnimation(const Value: Integer);
{détermine l'intervale entre deux affichage d'icone pour l'animation}
begin
  FIntervalAnimation := Value;
  TimerAnimationPetiteIcone.Interval:=FIntervalAnimation;
end;

procedure TPiconeBarreTache.SetNumIconeImageList(const Value: Integer);
begin
  FNumIconeImageList := Value;
  if not Animation then NumIconeAfficheImageList:=FNumIconeImageList;
end;

function droite(substr: string; s: string): string;
begin
  if pos(substr,s)=0 then result:='' else
    result:=copy(s, pos(substr, s)+length(substr), length(s)-pos(substr, s)+length(substr));
end;

function NbSousChaine(substr: string; s: string): integer;
{==================================================================================}
{ renvoie le nombre de fois que la sous chaine substr est présente dans la chaine S}
{==================================================================================}
begin
  result:=0;
  while pos(substr,s)<>0 do
  begin
    S:=droite(substr,s);
    inc(result);
  end;
end;


procedure TPiconeBarreTache.SetOrdreImageListAffiche(const Value: String);
var i:integer;
begin
  for i:=1 to Length(Value) do
  begin
    if not (Value[i] in ['0'..'9', ',']) then raise(ExceptionNumsImageLIstAffiche.Create('Erreur dans PiconeBarreTache : Mauvaise entrée dans NumsImageListAffiche. Mettre les numéros des images de la liste (ImageList) que vous voulez voir défiler séparés par des virgules'));
  end;
  if Value='' then NbNumOrdreImageListAffiche :=0 else NbNumOrdreImageListAffiche:=NbSousChaine(',',Value)+1;
  FOrdreImageListAffiche := Value;
end;

end.

