object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Keygen per WinEdt 10.3'
  ClientHeight = 183
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 120
  TextHeight = 20
  object Memo1: TMemo
    Left = 9
    Top = 112
    Width = 541
    Height = 57
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ReadOnly = True
    TabOrder = 0
  end
  object LabeledEdit1: TLabeledEdit
    Left = 137
    Top = 24
    Width = 328
    Height = 28
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    EditLabel.Width = 44
    EditLabel.Height = 20
    EditLabel.Margins.Left = 4
    EditLabel.Margins.Top = 4
    EditLabel.Margins.Right = 4
    EditLabel.Margins.Bottom = 4
    EditLabel.Caption = 'Nome:'
    LabelPosition = lpLeft
    TabOrder = 1
    Text = ''
  end
  object Button1: TButton
    Left = 193
    Top = 73
    Width = 177
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Genera chiave'
    TabOrder = 2
    OnClick = Button1Click
  end
end
