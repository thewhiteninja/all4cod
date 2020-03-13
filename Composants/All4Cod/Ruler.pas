unit Ruler;

// Version:        0.9
// Created:        by Aleksey Denisov
// Last modifyed:  March 31, 1998
// Web page:       http://www.geocities.com/CapeCanaveral/8002
// E-mail:         alex_den@geocities.com
// Status:         Freeware

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Math;    // possible some modules can be savely removed

type
  TOrientation = (orHoriz, orVert);
  TCaptionAlign = (caTopLeft, caBottomRight);
  TNumberAlign = (naCenter, naBottomRight, naTopLeft);
  TTickAlign = (taBottomRight, taTopLeft);
  TFontRotation = (fr0, fr90, fr180, fr270);

  TValRange = class(TPersistent)    // is used for setting roll limits
  private
    FMinValid: Boolean;
    FMin: Double;
    FMaxValid: Boolean;
    FMax: Double;
  published
    property MinValid: Boolean read FMinValid write FMinValid;
    property Min: Double read FMin write FMin;
    property MaxValid: Boolean read FMaxValid write FMaxValid;
    property Max: Double read FMax write FMax;
  end;


  TRuler = class(TCustomControl)
  private
    FCaption: String;
    FCaptionAlign: TCaptionAlign;
    FCaptionIndent1: Integer;
    FCaptionIndent2: Integer;
    FColor: TColor;
    FEnableRepaint: Boolean;
    FFont: TFont;
    FFontRotation: TFontRotation;
    FNumberAlign: TNumberAlign;
    FNumberIndent: Integer;
    FOrientation: TOrientation;
    FRollEnabled: Boolean;
    FRollLimits: TValRange;
    FStartValue: Double;
    FSzBig: Integer;
    FSzMiddle: Integer;
    FSzSmall: Integer;
    FTickAlign: TTickAlign;
    FTickColor: TColor;
    FUnitSize: Double;
    FUnitPrice: Double;
    FUnitPrecision: Integer;
    MousePressed: Boolean;
    MousePos: Integer;
  protected
    procedure Paint; override;
    procedure SetCaption(ACaption: String);
    procedure SetCaptionAlign(AnAlign: TCaptionAlign);
    procedure SetCaptionIndent1(AnIndent: Integer);
    procedure SetCaptionIndent2(AnIndent: Integer);
    procedure SetColor(AColor: TColor);
    procedure SetFont(AFont: TFont);
    procedure SetFontRotation(AFontRot: TFontRotation);
    procedure SetNumberAlign(ANumAlign: TNumberAlign);
    procedure SetNumberIndent(AnIndent: Integer);
    procedure SetOrientation(AnOrientation: TOrientation);
    procedure SetStartValue(AStartVal: Double);
    procedure SetSzBig(ASize: Integer);
    procedure SetSzMiddle(ASize: Integer);
    procedure SetSzSmall(ASize: Integer);
    procedure SetTickAlign(ATickAlign: TTickAlign);
    procedure SetUnitSize(AUnitSize: Double);
    procedure SetUnitPrice(AUnitPrice: Double);
    procedure SetUnitPrecision(APrecision: Integer);
    procedure MouseDown(Button: TMouseButton;
                        Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton;
                      Shift: TShiftState; X, Y: Integer);   override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property Caption: String read FCaption write SetCaption;
    property CaptionAlign: TCaptionAlign read FCaptionAlign write SetCaptionAlign;
    property CaptionIndent1: Integer read FCaptionIndent1 write SetCaptionIndent1;
    property CaptionIndent2: Integer read FCaptionIndent2 write SetCaptionIndent2;
    property Color: TColor read FColor write SetColor;
    property Enabled;
    property EnableRepaint: Boolean read FEnableRepaint write FEnableRepaint;
    property Font: TFont read FFont write SetFont;
    property FontRotation: TFontRotation read FFontRotation write SetFontRotation;
    property Hint;
    property NumberAlign: TNumberAlign read FNumberAlign write SetNumberAlign;
    property NumberIndent: Integer read FNumberIndent write SetNumberIndent;
    property Orientation: TOrientation read FOrientation write SetOrientation;
    property ParentShowHint;
    property RollEnabled: Boolean read FRollEnabled write FRollEnabled;
    property RollLimits: TValRange read FRollLimits write FRollLimits;
    property StartValue: Double read FStartValue write SetStartValue;
    property TickAlign: TTickAlign read FTickAlign write SetTickAlign;
    property TickColor: TColor read FTickColor write FTickColor;
    property TickSizeBig: Integer read FSzBig write SetSzBig;
    property TickSizeMiddle: Integer read FSzMiddle write SetSzMiddle;
    property TickSizeSmall: Integer read FSzSmall write SetSzSmall;
    property UnitSize: Double read FUnitSize write SetUnitSize;
    property UnitPrice: Double read FUnitPrice write SetUnitPrice;
    property UnitPrecision: Integer read FUnitPrecision write SetUnitPrecision;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnClick;
  end;

procedure Register;

implementation

constructor TRuler.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csCaptureMouse, csOpaque, csClickEvents, csDoubleClicks];
  FColor := clYellow;
  FOrientation := orHoriz;
  FFont := TFont.Create;
  FFont.Name := 'Tahoma';
  FFont.Height := -9;
  Width := 200;
  Height := 16;
  FUnitSize := 50;
  FUnitPrice := 1;
  FUnitPrecision := 0;
  FSzBig := 45;
  FSzMiddle := 35;
  FSzSmall := 15;
  FTickColor := clBlack;
  FNumberIndent := 0;
  FNumberAlign := naCenter;
  FRollLimits := TValRange.Create;
  FRollLimits.Max := 100;
  FEnableRepaint := True;
end;

procedure TRuler.Paint;
var
  TickCount: Integer;
  szBig, szMiddle, szSmall: Integer;
  Pos, Tenth, D: Double;
  iPos, Val: Integer;
  lf: TLogFont;
  tf: TFont;
  P0, P1, P2, P3: Integer;
  S: String;
  Sw, Sh: Integer;
begin
  D := Ceil(FStartValue * 10) / 10;
  Pos := (D - FStartValue - 1) * FUnitSize;
  TickCount := Round((D - Floor(FStartValue)) * 10);
  Tenth := FUnitSize / 10;
  Val := Ceil(FStartValue - 1);
  if FOrientation = orHoriz then
  begin
    szBig := FSzBig * Height div 100;
    szMiddle := FSzMiddle * Height div 100;
    szSmall := FSzSmall * Height div 100;
  end
  else
  begin
    szBig := FSzBig * Width div 100;
    szMiddle := FSzMiddle * Width div 100;
    szSmall := FSzSmall * Width div 100;
  end;
  inherited Paint;
  with Canvas do
  begin
    Pen.Color := FTickColor;
    Pen.Style := psSolid;
    Pen.Width := 1;

    tf := TFont.Create;
    tf.Assign(FFont);
    GetObject(tf.Handle, SizeOf(lf), @lf);
    case FFontRotation of
      fr0:   lf.lfEscapement := 0;
      fr90:  lf.lfEscapement := 900;
      fr180: lf.lfEscapement := 1800;
      fr270: lf.lfEscapement := 2700;
    end;
    tf.Handle := CreateFontIndirect(lf);
    Font.Assign(tf);

    Brush.Color := FColor;
    Brush.Style := bsSolid;
    FillRect(Rect(0, 0, Width, Height));

    Sh := TextHeight('0');

    if FOrientation = orHoriz then
    begin
      if FTickAlign = taBottomRight then
      begin
        P0 := Height-1;
        P1 := Height-1-szBig; P2 := Height-1-szMiddle; P3 := Height-1-szSmall;
      end
      else // TickAlign = taTopRight
      begin
        P0 := 0;
        P1 := szBig; P2 := szMiddle; P3 := szSmall;
      end;

      while Pos < Width - 1 do
      begin
        iPos := Round(Pos);
        if TickCount > 9 then TickCount := 0;
        if TickCount = 0 then
        begin
          S := Format('%.*f',[FUnitPrecision, Val*FUnitPrice]);
          Sw := TextWidth(S);

          case FNumberAlign of
            naCenter:
              case FFontRotation of
                fr0: TextOut(iPos - Sw div 2, FNumberIndent-1, S);
                fr90: TextOut(iPos - Sh div 2, FNumberIndent + Sw, S);
                fr180: TextOut(iPos + Sw div 2, FNumberIndent + Sh, S);
                fr270: TextOut(iPos + Sh div 2, FNumberIndent, S);
              end;
            naBottomRight:
              case FFontRotation of
                fr0: TextOut(iPos + 2, FNumberIndent, S);
                fr90: TextOut(iPos, FNumberIndent + Sw, S);
                fr180: TextOut(iPos + Sw + 1, FNumberIndent + Sh, S);
                fr270: TextOut(iPos + Sh + 1, FNumberIndent, S);
              end;
            naTopLeft:
              case FFontRotation of
                fr0: TextOut(iPos - Sw, FNumberIndent, S);
                fr90: TextOut(iPos - Sh, FNumberIndent + Sw, S);
                fr180: TextOut(iPos, FNumberIndent + Sh, S);
                fr270: TextOut(iPos, FNumberIndent, S);
              end;
          end;

          MoveTo(iPos, P0);
          LineTo(iPos, P1);
          Inc(Val);
        end
        else if TickCount = 5 then
        begin
          MoveTo(iPos, P0);
          LineTo(iPos, P2);
        end
        else
        begin
          MoveTo(iPos, P0);
          LineTo(iPos, P3);
        end;
        Inc(TickCount);
        Pos := Pos + Tenth;
      end;
      if FCaption <> '' then
      begin
        Sw := TextWidth(FCaption);
        Brush.Color := Color;
        if FCaptionAlign = caTopLeft then
          case FFontRotation of
            fr0: TextOut(CaptionIndent1, CaptionIndent2, FCaption);
            fr90: TextOut(CaptionIndent1, CaptionIndent2+Sw, FCaption);
            fr180: TextOut(CaptionIndent1+Sw, CaptionIndent2+Sh, FCaption);
            fr270: TextOut(CaptionIndent1+Sh, CaptionIndent2, FCaption);
          end
        else
          case FFontRotation of
            fr0: TextOut(Width-CaptionIndent1-Sw, CaptionIndent2, FCaption);
            fr90: TextOut(Width-CaptionIndent1-Sh, CaptionIndent2+Sw, FCaption);
            fr180: TextOut(Width-CaptionIndent1, CaptionIndent2+Sh, FCaption);
            fr270: TextOut(Width-CaptionIndent1, CaptionIndent2, FCaption);
          end
      end;
    end
    else //orVert
    begin
      if FTickAlign = taBottomRight then
      begin
        P0 := Width-1;
        P1 := Width-1-szBig; P2 := Width-1-szMiddle; P3 := Width-1-szSmall;
      end
      else // TickAlign = taTopRight
      begin
        P0 := 0;
        P1 := szBig; P2 := szMiddle; P3 := szSmall;
      end;

      while Pos < Height - 1 do
      begin
        iPos := Round(Pos);
        if TickCount > 9 then TickCount := 0;
        if TickCount = 0 then
        begin
          S := Format('%.*f',[FUnitPrecision, Val*FUnitPrice]);
          Sw := TextWidth(S);

          case FNumberAlign of
            naCenter:
              case FFontRotation of
                fr0: TextOut(FNumberIndent+1, iPos - Sh div 2, S);
                fr90: TextOut(FNumberIndent-1, iPos+Sw div 2+1, S);
                fr180: TextOut(FNumberIndent + Sw, iPos + Sh div 2+1, S);
                fr270: TextOut(FNumberIndent + Sh, iPos - Sw div 2 + 1, S);
              end;
            naBottomRight:
              case FFontRotation of
                fr0: TextOut(FNumberIndent+1, iPos, S);
                fr90: TextOut(FNumberIndent, iPos+Sw+1, S);
                fr180: TextOut(FNumberIndent + Sw, iPos + Sh + 1, S);
                fr270: TextOut(FNumberIndent + Sh, iPos+2, S);
              end;
            naTopLeft:
              case FFontRotation of
                fr0: TextOut(FNumberIndent, iPos-Sh, S);
                fr90: TextOut(FNumberIndent, iPos-1, S);
                fr180: TextOut(FNumberIndent + Sw, iPos, S);
                fr270: TextOut(FNumberIndent + Sh, iPos+2, S);
              end;
          end;

          MoveTo(P0, iPos);
          LineTo(P1, iPos);
          Inc(Val);
        end
        else if TickCount = 5 then
        begin
          MoveTo(P0, iPos);
          LineTo(P2, iPos);
        end
        else
        begin
          MoveTo(P0, iPos);
          LineTo(P3, iPos);
        end;
        Inc(TickCount);
        Pos := Pos + Tenth;
      end;
      if FCaption <> '' then
      begin
        Sw := TextWidth(FCaption);
        Brush.Color := Color;
        if FCaptionAlign = caTopLeft then
          case FFontRotation of
            fr0: TextOut(CaptionIndent2, CaptionIndent1, FCaption);
            fr90: TextOut(CaptionIndent2, CaptionIndent1+Sw, FCaption);
            fr180: TextOut(CaptionIndent2+Sw, CaptionIndent1+Sh, FCaption);
            fr270: TextOut(CaptionIndent2+Sh, CaptionIndent1, FCaption);
          end
        else
          case FFontRotation of
            fr0: TextOut(CaptionIndent2, Height-CaptionIndent1-Sh, FCaption);
            fr90: TextOut(CaptionIndent2, Height-CaptionIndent1, FCaption);
            fr180: TextOut(CaptionIndent2+Sw, Height-CaptionIndent1, FCaption);
            fr270: TextOut(CaptionIndent2+Sh, Height-CaptionIndent1-Sw, FCaption);
          end;
      end;
    end;

    tf.Free;
  end;
end;

procedure TRuler.MouseDown(Button: TMouseButton;
                           Shift: TShiftState; X, Y: Integer);
begin
  if FOrientation = orHoriz then MousePos := X
  else MousePos := Y;
  if FRollEnabled then MousePressed := True;
end;

procedure TRuler.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  d: Integer;
  OldSV, NewSV: Double;
begin
  if not MousePressed then Exit;

  if FOrientation = orHoriz then
  begin
    d := X - MousePos;
    MousePos := X;
  end
  else
  begin
    d := Y - MousePos;
    MousePos := Y;
  end;

  if d <> 0 then
  begin
    OldSV := FStartValue;
    NewSV := FStartValue - d / FUnitSize;
    if FRollLimits.MinValid then
      if NewSV < FRollLimits.Min then
        NewSV := FRollLimits.Min;
    if FRollLimits.MaxValid then
      if NewSV > FRollLimits.Max then
        NewSV := FRollLimits.Max;
    if NewSV <> OldSV then Invalidate;
    FStartValue := NewSV;
  end;

  if Assigned(OnMouseMove) then OnMouseMove(self, Shift, X, Y);
end;

procedure TRuler.MouseUp(Button: TMouseButton;
                         Shift: TShiftState; X, Y: Integer);
begin
  if MousePressed and Assigned(OnClick) then OnClick(self);
  MousePressed := False;
end;


procedure TRuler.SetCaption(ACaption: String);
begin
  if FCaption = ACaption then Exit;
  FCaption := ACaption;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetCaptionAlign(AnAlign: TCaptionAlign);
begin
  if FCaptionAlign = AnAlign then Exit;
  FCaptionAlign := AnAlign;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetCaptionIndent1(AnIndent: Integer);
begin
  if FCaptionIndent1 = AnIndent then Exit;
  FCaptionIndent1 := AnIndent;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetCaptionIndent2(AnIndent: Integer);
begin
  if FCaptionIndent2 = AnIndent then Exit;
  FCaptionIndent2 := AnIndent;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetColor(AColor: TColor);
begin
  if FColor = AColor then Exit;
  FColor := AColor;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetFont(AFont: TFont);
begin
  FFont.Assign(AFont);
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetFontRotation(AFontRot: TFontRotation);
begin
  if FFontRotation = AFontRot then Exit;
  FFontRotation := AFontRot;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetNumberAlign(ANumAlign: TNumberAlign);
begin
  if FNumberAlign = ANumAlign then Exit;
  FNumberAlign := ANumAlign;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetNumberIndent(AnIndent: Integer);
begin
  if FNumberIndent = AnIndent then Exit;
  FNumberIndent := AnIndent;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetOrientation(AnOrientation: TOrientation);
var
  t: Integer;
begin
  if FOrientation = AnOrientation then Exit; // do nothing if the same
  FOrientation := AnOrientation;
  if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
  begin
    t := Height;
    Height := Width;
    Width := t;
    if FOrientation = orHoriz then
    begin
      FontRotation := fr0;
    end
    else
    begin
      FontRotation := fr90;
    end;

  end;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetStartValue(AStartVal: Double);
begin
  if FStartValue = AStartVal then Exit;  // do nothing if the same
  FStartValue := AStartVal;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetSzBig(ASize: Integer);
begin
  if FSzBig = ASize then Exit;
  FSzBig := ASize;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetSzMiddle(ASize: Integer);
begin
  if FSzMiddle = ASize then Exit;
  FSzMiddle := ASize;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetSzSmall(ASize: Integer);
begin
  if FSzSmall = ASize then Exit;
  FSzSmall := ASize;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetTickAlign(ATickAlign: TTickAlign);
begin
  if FTickAlign = ATickAlign then Exit;
  FTickAlign := ATickAlign;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetUnitSize(AUnitSize: Double);
begin
  if FUnitSize = AUnitSize then Exit;
  FUnitSize := AUnitSize;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetUnitPrice(AUnitPrice: Double);
begin
  if FUnitPrice = AUnitPrice then Exit;
  FUnitPrice := AUnitPrice;
  if FEnableRepaint then Invalidate;
end;

procedure TRuler.SetUnitPrecision(APrecision: Integer);
begin
  if FUnitPrecision = APrecision then Exit;
  if APrecision < 0 then APrecision := 0;
  FUnitPrecision := APrecision;
  if FEnableRepaint then Invalidate;
end;

procedure Register;
begin
  RegisterComponents('Samples', [TRuler]);
end;

end.
