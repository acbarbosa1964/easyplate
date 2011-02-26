object FrmDsnEdit: TFrmDsnEdit
  Left = 0
  Top = 0
  Width = 669
  Height = 460
  TabOrder = 0
  object pgcDesignFormCode: TEasyPageControl
    Left = 0
    Top = 0
    Width = 669
    Height = 460
    ActivePage = EasyTabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    TabOrientation = toBottom
    FixedDimension = 19
    object EasyTabSheet1: TEasyTabSheet
      Caption = #31383#20307
      object DesignSurface1: TDesignSurface
        Left = 0
        Top = 0
        Width = 667
        Height = 439
        HideFormBorders = True
        Align = alClient
        Color = clWindow
        ParentColor = False
        TabOrder = 0
      end
    end
    object EasyTabSheet2: TEasyTabSheet
      Caption = #33050#26412
      object Splitter1: TSplitter
        Left = 479
        Top = 0
        Height = 439
        Align = alRight
      end
      object EasyPanel1: TEasyPanel
        Left = 482
        Top = 0
        Width = 185
        Height = 439
        Align = alRight
        TabOrder = 1
        object EventsList: TListBox
          Left = 2
          Top = 2
          Width = 181
          Height = 435
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object EasyPanel2: TEasyPanel
        Left = 0
        Top = 0
        Width = 479
        Height = 439
        Align = alClient
        TabOrder = 0
        object CodeEditor: TSyntaxMemo
          Left = 2
          Top = 2
          Width = 475
          Height = 435
          SyntaxAnalyzer = SyntAnalyzer1
          TabList.AsString = '4'
          NonPrinted.Font.Charset = DEFAULT_CHARSET
          NonPrinted.Font.Color = clSilver
          NonPrinted.Font.Height = -11
          NonPrinted.Font.Name = 'MS Sans Serif'
          NonPrinted.Font.Style = []
          LineNumbers.UnderColor = clBlack
          LineNumbers.Font.Charset = DEFAULT_CHARSET
          LineNumbers.Font.Color = clBlack
          LineNumbers.Font.Height = -11
          LineNumbers.Font.Name = 'Courier New'
          LineNumbers.Font.Style = []
          LineNumbers.Band = 0
          Gutter.Width = 32
          Gutter.ExpandButtons.Data = {
            FA000000424DFA000000000000007600000028000000120000000B0000000100
            0400000000008400000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00111111111111
            1111110000000000000000000000000000000FFFFFFF00FFFFFFF00000000FFF
            FFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000F00000F00F00000F000
            00000FFFFFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000FFFFFFF00FF
            FFFFF0000000000000000000000000000000111111111111111111000000}
          Gutter.Bands = <
            item
              Width = 20
              Color = 16764622
              Gradient = True
              GradientRight = 9961471
            end
            item
              Width = 12
              Color = 9961471
              Gradient = True
            end>
          Gutter.Objects = <>
          Gutter.ExpBtnBand = 1
          Gutter.CollapsePen.Color = clGray
          Gutter.AutoSize = False
          HintProps.Font.Charset = DEFAULT_CHARSET
          HintProps.Font.Color = clWindowText
          HintProps.Font.Height = -11
          HintProps.Font.Name = 'MS Sans Serif'
          HintProps.Font.Style = []
          HintProps.Color = 13041663
          HintProps.ShowHints = [shScroll, shCollapsed, shGutter, shTokens]
          UserRanges = <>
          StaplePen.Color = clGray
          DefaultStyles.SelectioMark.Font.Charset = DEFAULT_CHARSET
          DefaultStyles.SelectioMark.Font.Color = clHighlightText
          DefaultStyles.SelectioMark.Font.Height = -13
          DefaultStyles.SelectioMark.Font.Name = 'Courier New'
          DefaultStyles.SelectioMark.Font.Style = []
          DefaultStyles.SelectioMark.BgColor = clHighlight
          DefaultStyles.SelectioMark.FormatType = ftColor
          DefaultStyles.SearchMark.Font.Charset = DEFAULT_CHARSET
          DefaultStyles.SearchMark.Font.Color = clWhite
          DefaultStyles.SearchMark.Font.Height = -13
          DefaultStyles.SearchMark.Font.Name = 'Courier New'
          DefaultStyles.SearchMark.Font.Style = []
          DefaultStyles.SearchMark.BgColor = clBlack
          DefaultStyles.SearchMark.FormatType = ftColor
          DefaultStyles.CurrentLine.Enabled = False
          DefaultStyles.CurrentLine.Font.Charset = DEFAULT_CHARSET
          DefaultStyles.CurrentLine.Font.Color = clWindowText
          DefaultStyles.CurrentLine.Font.Height = -13
          DefaultStyles.CurrentLine.Font.Name = 'Courier New'
          DefaultStyles.CurrentLine.Font.Style = []
          DefaultStyles.CurrentLine.FormatType = ftBackGround
          DefaultStyles.CollapseMark.Font.Charset = DEFAULT_CHARSET
          DefaultStyles.CollapseMark.Font.Color = clSilver
          DefaultStyles.CollapseMark.Font.Height = -13
          DefaultStyles.CollapseMark.Font.Name = 'Courier New'
          DefaultStyles.CollapseMark.Font.Style = []
          DefaultStyles.CollapseMark.FormatType = ftColor
          DefaultStyles.CollapseMark.BorderTypeLeft = blSolid
          DefaultStyles.CollapseMark.BorderColorLeft = clSilver
          DefaultStyles.CollapseMark.BorderTypeTop = blSolid
          DefaultStyles.CollapseMark.BorderColorTop = clSilver
          DefaultStyles.CollapseMark.BorderTypeRight = blSolid
          DefaultStyles.CollapseMark.BorderColorRight = clSilver
          DefaultStyles.CollapseMark.BorderTypeBottom = blSolid
          DefaultStyles.CollapseMark.BorderColorBottom = clSilver
          SyncEditing.SyncRangeStyle.Font.Charset = DEFAULT_CHARSET
          SyncEditing.SyncRangeStyle.Font.Color = clWindowText
          SyncEditing.SyncRangeStyle.Font.Height = -13
          SyncEditing.SyncRangeStyle.Font.Name = 'Courier New'
          SyncEditing.SyncRangeStyle.Font.Style = []
          SyncEditing.SyncRangeStyle.BgColor = 14745568
          SyncEditing.SyncRangeStyle.FormatType = ftBackGround
          SyncEditing.ActiveWordsStyle.Font.Charset = DEFAULT_CHARSET
          SyncEditing.ActiveWordsStyle.Font.Color = clWindowText
          SyncEditing.ActiveWordsStyle.Font.Height = -13
          SyncEditing.ActiveWordsStyle.Font.Name = 'Courier New'
          SyncEditing.ActiveWordsStyle.Font.Style = []
          SyncEditing.ActiveWordsStyle.FormatType = ftBackGround
          SyncEditing.ActiveWordsStyle.BorderTypeLeft = blSolid
          SyncEditing.ActiveWordsStyle.BorderColorLeft = clBlue
          SyncEditing.ActiveWordsStyle.BorderTypeTop = blSolid
          SyncEditing.ActiveWordsStyle.BorderColorTop = clBlue
          SyncEditing.ActiveWordsStyle.BorderTypeRight = blSolid
          SyncEditing.ActiveWordsStyle.BorderColorRight = clBlue
          SyncEditing.ActiveWordsStyle.BorderTypeBottom = blSolid
          SyncEditing.ActiveWordsStyle.BorderColorBottom = clBlue
          SyncEditing.InactiveWordsStyle.Font.Charset = DEFAULT_CHARSET
          SyncEditing.InactiveWordsStyle.Font.Color = clWindowText
          SyncEditing.InactiveWordsStyle.Font.Height = -13
          SyncEditing.InactiveWordsStyle.Font.Name = 'Courier New'
          SyncEditing.InactiveWordsStyle.Font.Style = []
          SyncEditing.InactiveWordsStyle.FormatType = ftBackGround
          SyncEditing.InactiveWordsStyle.BorderTypeBottom = blSolid
          SyncEditing.InactiveWordsStyle.BorderColorBottom = clBtnFace
          DragTypeOLE = True
          Options = [soOverwriteBlocks, soEnableBlockSel, soCopyAsRTF, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soScrollLastLine]
          Align = alClient
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object FormDesigner: TzFormDesigner
    OnKeyDown = FormDesignerKeyDown
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = []
    CloseDisactive = False
    SelMarker.Color = clBlack
    SelMarker.GrabSize = 7
    SelMarker.MarkerShape = msRoundRect
    SelMarker.Bitmap.Data = {
      A6040000424DA60400000000000036040000280000000E000000070000000100
      0800000000007000000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000509F2E8F209
      050508F7F7F70805000009E8E8E8E8E80908F7F7F7F7F7080000F2E8E8E8E8E8
      F2F7F7F7F7F7F7F70000E8F209F2E8E8E8F7F707F7F7F7F70000F2090909E8E8
      F2F7070707F7F7F7000009F209F2E8E80908F707F7F7F7F600000509F2E8E909
      050508F7F7A4F6050000}
    TextEditMode = False
    OnCanRename = FormDesignerCanRename
    DesignSurface = DesignSurface1
    OnShowMethod = FormDesignerShowMethod
    OnGetScriptProc = FormDesignerGetScriptProc
    OnSetScriptProc = FormDesignerSetScriptProc
    OnGetMethodNames = FormDesignerGetMethodNames
    Left = 32
    Top = 24
  end
  object SyntAnalyzer1: TSyntAnalyzer
    Formats = <
      item
        DisplayName = 'Default'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        FormatType = ftCustomFont
      end
      item
        DisplayName = 'Symbol'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
      end
      item
        DisplayName = 'Number'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
      end
      item
        DisplayName = 'String'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
      end
      item
        DisplayName = 'Identifier'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
      end
      item
        DisplayName = 'Reserved word'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
      end
      item
        DisplayName = 'Comment'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
      end
      item
        DisplayName = 'Preprocessor'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsItalic]
      end
      item
        DisplayName = 'Assembler'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BgColor = 15724510
        FormatType = ftBackGround
      end
      item
        DisplayName = 'Marked block'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clHighlightText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BgColor = clHighlight
        FormatType = ftColor
      end
      item
        DisplayName = 'Interface section'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BgColor = 15269887
        FormatType = ftBackGround
      end
      item
        DisplayName = 'Implemenation Section'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BgColor = 16121842
        FormatType = ftBackGround
      end
      item
        DisplayName = 'Function separator'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BgColor = clRed
        FormatType = ftBackGround
      end
      item
        DisplayName = 'Current block'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        BgColor = 13369046
        FormatType = ftColor
        BorderTypeLeft = blSolid
        BorderColorLeft = clGray
        BorderTypeTop = blSolid
        BorderColorTop = clGray
        BorderTypeRight = blSolid
        BorderColorRight = clGray
        BorderTypeBottom = blSolid
        BorderColorBottom = clGray
      end
      item
        DisplayName = 'Current function'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BgColor = 16776187
        FormatType = ftBackGround
        MultiLineBorder = True
      end
      item
        DisplayName = 'Current Line'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BgColor = 16772341
        FormatType = ftBackGround
      end
      item
        DisplayName = 'Search Match'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        BgColor = clBlack
        FormatType = ftCustomFont
      end
      item
        DisplayName = 'Group (tree)'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        FormatType = ftCustomFont
      end
      item
        DisplayName = 'Intern. function (tree)'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
      end
      item
        DisplayName = 'class (tree)'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
      end>
    TokenRules = <
      item
        DisplayName = 'Any name'
        StyleName = 'Identifier'
        TokenType = 2
        Expression = '[a-z_]\w*'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'String'
        StyleName = 'String'
        TokenType = 4
        Expression = #39'.*?('#39'|$)'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Float'
        StyleName = 'Number'
        TokenType = 6
        Expression = 
          '#with exp. dot is optional '#13#10'\d+ \.? \d+ e [\+\-]? \d+ |'#13#10'#witho' +
          'ut exp. dot is required'#13#10'\d+ \. \d+'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Integer'
        StyleName = 'Number'
        TokenType = 5
        Expression = '\d+'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Preprocessor 1'
        StyleName = 'Preprocessor'
        TokenType = 9
        Expression = '\{\$.*?\}'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Preprocessor 2'
        StyleName = 'Preprocessor'
        TokenType = 9
        Expression = '\(\*\$.*?\*\)'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Comment 1'
        StyleName = 'Comment'
        TokenType = 1
        Expression = '(?s)\(\*.*?(\*\)|\Z)'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Comment 2'
        StyleName = 'Comment'
        TokenType = 1
        Expression = '(?s)\{.*?(\}|\Z)'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Comment 3'
        StyleName = 'Comment'
        AlwaysEnabled = True
        TokenType = 1
        Expression = '//.*'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'HEX'
        StyleName = 'Number'
        TokenType = 7
        Expression = '\$[a-f\d]+'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Symbol'
        StyleName = 'Symbol'
        TokenType = 3
        Expression = '[/\*,\.;:\(\)=<>\+\-\[\]]'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Char'
        StyleName = 'String'
        TokenType = 8
        Expression = '\#(\d+|\$[\da-f]+)'
        ColumnFrom = 0
        ColumnTo = 0
      end>
    BlockRules = <
      item
        DisplayName = 'Key words'
        StyleName = 'Reserved word'
        BlockType = btTagDetect
        ConditionList = <
          item
            TagList.Strings = (
              'abstract'
              'and'
              'array'
              'as'
              'asm'
              'begin'
              'case'
              'class'
              'const'
              'constructor'
              'contains'
              'destructor'
              'dispinterface'
              'div'
              'do'
              'downto'
              'dynamic'
              'else'
              'end'
              'except'
              'exports'
              'file'
              'finalization'
              'finally'
              'for'
              'function'
              'goto'
              'if'
              'implementation'
              'in'
              'index'
              'inherited'
              'initialization'
              'inline'
              'interface'
              'is'
              'label'
              'library'
              'mod'
              'nil'
              'not'
              'object'
              'of'
              'or'
              'out'
              'override'
              'package'
              'packed'
              'pascal'
              'private'
              'procedure'
              'program'
              'property'
              'protected'
              'public'
              'published'
              'raise'
              'read'
              'record'
              'register'
              'repeat'
              'requires'
              'resourcestring'
              'safecall'
              'set'
              'shl'
              'shr'
              'stdcall'
              'string'
              'then'
              'threadvar'
              'to'
              'try'
              'type'
              'unit'
              'until'
              'uses'
              'var'
              'virtual'
              'while'
              'with'
              'write'
              'xor')
            TokenTypes = 4
            IgnoreCase = True
          end>
        HighlightPos = cpAny
      end
      item
        DisplayName = 'Forward'
        StyleName = 'Reserved word'
        BlockType = btTagDetect
        ConditionList = <
          item
            TagList.Strings = (
              'forward'
              'of')
            TokenTypes = 4
            IgnoreCase = True
          end>
        HighlightPos = cpAny
        TokenType = 10
      end
      item
        DisplayName = 'begin'
        StyleName = 'Current block'
        ConditionList = <
          item
            TagList.Strings = (
              'begin'
              'case'
              'try')
            TokenTypes = 4
            IgnoreCase = True
          end>
        BlockEnd = 'End'
        DisplayInTree = False
        DynHighlight = dhBound
        HighlightPos = cpRange
        DynSelectMin = True
        DrawStaple = True
        CollapseFmt = '%s0 ...'
      end
      item
        DisplayName = 'End'
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              'end')
            TokenTypes = 4
            IgnoreCase = True
          end>
        HighlightPos = cpAny
      end
      item
        DisplayName = 'asm'
        StyleName = 'Assembler'
        ConditionList = <
          item
            TagList.Strings = (
              'asm')
            TokenTypes = 4
            IgnoreCase = True
          end>
        BlockEnd = 'End'
        Highlight = True
        InvertColors = True
        DisplayInTree = False
        DynHighlight = dhRangeNoBound
        HighlightPos = cpAny
        CollapseFmt = 'ASM'
      end
      item
        DisplayName = '{$ifdef}'
        ConditionList = <
          item
            TagList.Strings = (
              '\{\$if[n]?def')
            CondType = tcMask
            TokenTypes = 512
            IgnoreCase = True
          end>
        BlockEnd = '{$endif}'
        DisplayInTree = False
        HighlightPos = cpAny
        CollapseFmt = '%s0'
      end
      item
        DisplayName = '{$endif}'
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              '{$endif}')
            TokenTypes = 512
            IgnoreCase = True
          end>
        HighlightPos = cpAny
      end
      item
        DisplayName = 'until'
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              'until')
            TokenTypes = 4
            IgnoreCase = True
          end>
        HighlightPos = cpAny
      end
      item
        DisplayName = 'repeat'
        ConditionList = <
          item
            TagList.Strings = (
              'repeat')
            TokenTypes = 4
            IgnoreCase = True
          end>
        BlockEnd = 'until'
        DisplayInTree = False
        HighlightPos = cpAny
        DrawStaple = True
        CollapseFmt = 'repeat ...'
      end
      item
        DisplayName = 'class declaration'
        BlockName = 'class declaration'
        NotParent = True
        ConditionList = <>
        BlockEnd = 'end of type'
        NameFmt = '%s-2 %s0'
        RefToCondEnd = True
        HighlightPos = cpAny
        CollapseFmt = '%s-2 %s0'
        GrammaRuleName = 'ClassDecl'
        TreeItemStyle = 'class (tree)'
        TreeItemImage = 1
      end
      item
        DisplayName = 'record'
        ConditionList = <
          item
            TagList.Strings = (
              'record')
            TokenTypes = 4
            IgnoreCase = True
          end
          item
            TagList.Strings = (
              '=')
            TokenTypes = 8
          end
          item
            TokenTypes = 4
          end>
        BlockEnd = 'end of type'
        NameFmt = '%s-2 %s0'
        GroupFmt = 'Types'
        RefToCondEnd = True
        HighlightPos = cpAny
        CollapseFmt = '%s-2 %s0'
        TreeGroupStyle = 'Group (tree)'
        TreeItemImage = 3
        TreeGroupImage = 0
      end
      item
        DisplayName = 'end of type'
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              ';')
            TokenTypes = 8
          end
          item
            TagList.Strings = (
              'end')
            TokenTypes = 4
            IgnoreCase = True
          end>
        HighlightPos = cpAny
        CancelNextRules = True
      end
      item
        DisplayName = 'Block comment'
        BlockName = 'Block comment'
        NotParent = True
        ConditionList = <
          item
            TokenTypes = 2
          end>
        BlockEnd = 'Block comment end'
        DisplayInTree = False
        HighlightPos = cpAny
        CollapseFmt = '{ ... }'
      end
      item
        DisplayName = 'Block comment end'
        BlockType = btRangeEnd
        ConditionList = <
          item
            CondType = tcNotEqual
            TokenTypes = 2
          end
          item
            TokenTypes = 2
          end>
        BlockOffset = 1
        HighlightPos = cpAny
      end
      item
        DisplayName = 'Function separator'
        StyleName = 'Function separator'
        StrictParent = True
        BlockType = btLineBreak
        ConditionList = <
          item
            TagList.Strings = (
              'constructor'
              'destructor'
              'function'
              'procedure')
            TokenTypes = 4
            IgnoreCase = True
          end>
        HighlightPos = cpAny
      end
      item
        DisplayName = 'Internal function'
        BlockName = 'function of class'
        ConditionList = <
          item
            TokenTypes = 4
          end
          item
            TagList.Strings = (
              'function'
              'procedure')
            TokenTypes = 4
            IgnoreCase = True
          end>
        BlockOffset = 1
        BlockEnd = 'End of internal'
        HighlightPos = cpAny
        CollapseFmt = '%s0 %s-1'
        TreeItemStyle = 'Intern. function (tree)'
        TreeItemImage = 5
      end
      item
        DisplayName = 'End of internal'
        BlockName = 'Internal function'
        StrictParent = True
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              ';')
            TokenTypes = 1032
          end
          item
            TagList.Strings = (
              'end'
              'forward')
            TokenTypes = 4
            IgnoreCase = True
          end>
        HighlightPos = cpAny
        CancelNextRules = True
      end
      item
        DisplayName = 'function'
        StyleName = 'Current function'
        StrictParent = True
        ConditionList = <
          item
            TagList.Strings = (
              '('
              ';')
            TokenTypes = 8
          end
          item
            TokenTypes = 4
          end
          item
            TagList.Strings = (
              'function'
              'procedure')
            TokenTypes = 4
            IgnoreCase = True
          end>
        IdentIndex = 1
        BlockOffset = 2
        BlockEnd = 'End of function'
        Highlight = True
        NameFmt = '%s2 %s1'
        GroupFmt = 'Functions'
        DynHighlight = dhRange
        HighlightPos = cpRange
        CollapseFmt = '%s2 %s1'
        TreeGroupStyle = 'Group (tree)'
        TreeItemImage = 5
        TreeGroupImage = 0
      end
      item
        DisplayName = 'End of function'
        BlockName = 'function'
        StrictParent = True
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              ';')
            TokenTypes = 1032
          end
          item
            TagList.Strings = (
              'end'
              'forward')
            TokenTypes = 4
            IgnoreCase = True
          end>
        HighlightPos = cpAny
      end
      item
        DisplayName = 'function of class'
        StyleName = 'Current function'
        StrictParent = True
        ConditionList = <
          item
            TagList.Strings = (
              '.')
            TokenTypes = 8
          end
          item
            TokenTypes = 4
          end
          item
            TagList.Strings = (
              'constructor'
              'destructor'
              'function'
              'procedure')
            TokenTypes = 4
            IgnoreCase = True
          end>
        IdentIndex = -1
        BlockOffset = 2
        BlockEnd = 'End of class function'
        Highlight = True
        NameFmt = '%s-1'
        GroupFmt = 'class %s1'
        DynHighlight = dhRange
        HighlightPos = cpRange
        CollapseFmt = '%s2 %s1%s0%s-1'
        TreeItemImage = 6
      end
      item
        DisplayName = 'End of class function'
        BlockName = 'function of class'
        StrictParent = True
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              ';')
            TokenTypes = 8
          end
          item
            TagList.Strings = (
              'end')
            TokenTypes = 4
            IgnoreCase = True
          end>
        HighlightPos = cpAny
      end
      item
        DisplayName = 'Internal function 2'
        BlockName = 'function'
        ConditionList = <
          item
            TokenTypes = 4
          end
          item
            TagList.Strings = (
              'function'
              'procedure')
            TokenTypes = 4
            IgnoreCase = True
          end>
        BlockOffset = 1
        BlockEnd = 'End of internal 2'
        HighlightPos = cpAny
        CollapseFmt = '%s0 %s-1'
        TreeItemStyle = 'Intern. function (tree)'
        TreeItemImage = 5
      end
      item
        DisplayName = 'End of internal 2'
        BlockName = 'Internal function 2'
        StrictParent = True
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              ';')
            TokenTypes = 8
          end
          item
            TagList.Strings = (
              'end'
              'forward')
            TokenTypes = 1028
            IgnoreCase = True
          end>
        HighlightPos = cpAny
      end
      item
        DisplayName = '('
        StyleName = 'Current block'
        ConditionList = <
          item
            TagList.Strings = (
              '(')
            TokenTypes = 8
          end>
        BlockEnd = ')'
        NotCollapsed = True
        DisplayInTree = False
        DynHighlight = dhBound
        HighlightPos = cpBoundTagBegin
        DynSelectMin = True
      end
      item
        DisplayName = ')'
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              ')')
            TokenTypes = 8
          end>
        HighlightPos = cpAny
      end
      item
        DisplayName = '['
        StyleName = 'Current block'
        ConditionList = <
          item
            TagList.Strings = (
              '[')
            TokenTypes = 8
          end>
        BlockEnd = ']'
        NotCollapsed = True
        DisplayInTree = False
        DynHighlight = dhBound
        HighlightPos = cpBoundTagBegin
        DynSelectMin = True
      end
      item
        DisplayName = ']'
        BlockType = btRangeEnd
        ConditionList = <
          item
            TagList.Strings = (
              ']')
            TokenTypes = 8
          end>
        HighlightPos = cpAny
      end>
    CodeTemplates = <
      item
        Name = 'be'
        Description = 'begin end'
        Code.Strings = (
          'begin'
          '  <caret>'
          'end;')
        Advanced = True
      end
      item
        Name = 'arrayd'
        Description = 'array declaration (var)'
        Code.Strings = (
          'array[0..|] of ;')
      end
      item
        Name = 'arrayc'
        Description = 'array declaration (const)'
        Code.Strings = (
          'array[0..|] of = ();')
      end
      item
        Name = 'cases'
        Description = 'case statement'
        Code.Strings = (
          'case | of'
          '  : ;'
          '  : ;'
          'end;')
      end
      item
        Name = 'casee'
        Description = 'case statement (with else)'
        Code.Strings = (
          'case | of'
          '  : ;'
          '  : ;'
          'else ;'
          'end;')
      end
      item
        Name = 'classf'
        Description = 'class declaration (all parts)'
        Code.Strings = (
          'T| = class(T)'
          'private'
          ''
          'protected'
          ''
          'public'
          ''
          'published'
          ''
          'end;')
      end
      item
        Name = 'classd'
        Description = 'class declaration (no parts)'
        Code.Strings = (
          'T| = class(T)'
          ''
          'end;')
      end
      item
        Name = 'classc'
        Description = 'class declaration (with Create/Destroy overrides)'
        Code.Strings = (
          'T| = class(T)'
          'private'
          ''
          'protected'
          ''
          'public'
          '  constructor Create; override;'
          '  destructor Destroy; override;'
          'published'
          ''
          'end;')
      end
      item
        Name = 'fors'
        Description = 'for (no begin/end)'
        Code.Strings = (
          'for | :=  to  do')
      end
      item
        Name = 'forb'
        Description = 'for statement'
        Code.Strings = (
          'for | :=  to  do'
          'begin'
          ''
          'end;')
      end
      item
        Name = 'function'
        Description = 'function declaration'
        Code.Strings = (
          'function |(): ;'
          'begin'
          ''
          'end;')
      end
      item
        Name = 'ifs'
        Description = 'if (no begin/end)'
        Code.Strings = (
          'if | then')
      end
      item
        Name = 'ifb'
        Description = 'if statement'
        Code.Strings = (
          'if | then'
          'begin'
          ''
          'end;')
      end
      item
        Name = 'ife'
        Description = 'if then (no begin/end) else (no begin/end)'
        Code.Strings = (
          'if | then'
          ''
          'else')
      end
      item
        Name = 'ifeb'
        Description = 'if then else'
        Code.Strings = (
          'if | then'
          'begin'
          ''
          'end'
          'else'
          'begin'
          ''
          'end;')
      end
      item
        Name = 'procedure'
        Description = 'procedure declaration'
        Code.Strings = (
          'procedure |();'
          'begin'
          ''
          'end;')
      end
      item
        Name = 'trye'
        Description = 'try except'
        Code.Strings = (
          'try'
          '  |'
          'except'
          ''
          'end;')
      end
      item
        Name = 'tryf'
        Description = 'try finally'
        Code.Strings = (
          'try'
          '  |'
          'finally'
          ''
          'end;')
      end
      item
        Name = 'trycf'
        Description = 'try finally (with Create/Free)'
        Code.Strings = (
          '|variable := typename.Create;'
          'try'
          ''
          'finally'
          '  variable.Free;'
          'end;')
      end
      item
        Name = 'whileb'
        Description = 'while statement'
        Code.Strings = (
          'while | do'
          'begin'
          ''
          'end;')
      end
      item
        Name = 'whiles'
        Description = 'while (no begin)'
        Code.Strings = (
          'while | do')
      end
      item
        Name = 'withb'
        Description = 'with statement'
        Code.Strings = (
          'with | do'
          'begin'
          ''
          'end;')
      end
      item
        Name = 'withs'
        Description = 'with (no begin)'
        Code.Strings = (
          'with | do')
      end
      item
        Name = 'prop'
        Description = 'property'
        Code.Strings = (
          'property | read  write;')
      end>
    SubAnalyzers = <>
    SampleText.Strings = (
      'implementation'
      '{Syntax highlighting}'
      'procedure TForm1.Button1Click(Sender: TObject);'
      'var'
      ' Number: integer;'
      ' FloatNumber: double;'
      'begin'
      ' Number := 123;  // View integer number style'
      
        ' Caprion := '#39'This Number is '#39' + IntToStr(Number); // View string' +
        ' style'
      ' Inc(Number, $1FA7); // View HEX style'
      ' {Assembler style}'
      ' asm'
      '   MOV  AX, 1234H'
      '   MOV Number, AX'
      ' end;'
      'end;')
    TokenTypeNames.Strings = (
      'Unknown'
      'Comment'
      'Identifier'
      'Symbol'
      'String'
      'Integer const'
      'Float const'
      'Hex const'
      'Char const'
      'Preprocessor'
      'Forward')
    Gramma.Gramma = #13#10
    MarkedBlockStyle = 'Marked block'
    SearchMatchStyle = 'Search Match'
    CurrentLineStyle = 'Current Line'
    DefaultStyleName = 'Default'
    Extentions = 'pas'
    LexerName = 'Pascal Script'
    Internal = True
    Left = 216
    Top = 48
  end
  object DesignerEvents1: TDesignerEvents
    OnItemDeleted = DesignerEvents1ItemDeleted
    Left = 64
    Top = 24
  end
end
