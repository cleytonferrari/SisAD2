object frmAguarde: TfrmAguarde
  Left = 192
  Top = 114
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 77
  ClientWidth = 201
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 77
    Align = alClient
    BevelInner = bvRaised
    TabOrder = 0
    object Label1: TLabel
      Left = 38
      Top = 12
      Width = 120
      Height = 29
      Caption = 'Aguarde!!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 47
      Width = 119
      Height = 13
      Caption = 'Carregando Solicita'#231#227'o...'
    end
  end
end
