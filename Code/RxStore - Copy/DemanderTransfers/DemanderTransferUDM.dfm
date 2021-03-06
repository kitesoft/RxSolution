object DemanderTransferDM: TDemanderTransferDM
  OldCreateOrder = False
  Left = 369
  Top = 93
  Height = 743
  Width = 1137
  object tblTransfers: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    AfterScroll = tblTransfersAfterScroll
    Parameters = <
      item
        Name = 'StartDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'EndDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM tblDemanderTransfer'
      'WHERE Created_dat>:StartDate'
      'AND Created_dat<:EndDate'
      'ORDER BY Created_dat')
    Left = 64
    Top = 96
  end
  object qryTransfersWorker: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    BeforePost = qryTransfersWorkerBeforePost
    AfterScroll = qryTransfersWorkerAfterScroll
    Parameters = <
      item
        Name = 'DemanderTransferID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM tblDemanderTransfer'
      'WHERE DemanderTransfer_ID=:DemanderTransferID')
    Left = 64
    Top = 168
    object qryTransfersWorkerDemanderTransfer_ID: TAutoIncField
      FieldName = 'DemanderTransfer_ID'
      ReadOnly = True
    end
    object qryTransfersWorkerCreated_dat: TDateTimeField
      FieldName = 'Created_dat'
    end
    object qryTransfersWorkerDemanderTransferRefNo_str: TWideStringField
      FieldName = 'DemanderTransferRefNo_str'
      Size = 50
    end
    object qryTransfersWorkerDemanderFrom_ID: TIntegerField
      FieldName = 'DemanderFrom_ID'
      OnChange = qryTransfersWorkerDemanderFrom_IDChange
    end
    object qryTransfersWorkerDemanderTo_ID: TIntegerField
      FieldName = 'DemanderTo_ID'
      OnChange = qryTransfersWorkerDemanderTo_IDChange
    end
    object qryTransfersWorkerLastUpdated_dat: TDateTimeField
      FieldName = 'LastUpdated_dat'
    end
    object qryTransfersWorkerLastUpdatedBy_str: TWideStringField
      FieldName = 'LastUpdatedBy_str'
      Size = 50
    end
    object qryTransfersWorkerAccount_ID: TIntegerField
      FieldName = 'Account_ID'
      OnChange = qryTransfersWorkerAccount_IDChange
    end
    object qryTransfersWorkerAccountName_str: TWideStringField
      FieldName = 'AccountName_str'
      Size = 50
    end
    object qryTransfersWorkerReference_str: TWideStringField
      FieldName = 'Reference_str'
      Size = 50
    end
    object qryTransfersWorkerRequestedDate_dat: TDateTimeField
      FieldName = 'RequestedDate_dat'
    end
    object qryTransfersWorkerPostedDate_dat: TDateTimeField
      FieldName = 'PostedDate_dat'
    end
    object qryTransfersWorkerPosted_bol: TBooleanField
      FieldName = 'Posted_bol'
    end
    object qryTransfersWorkerAuthorisedBy_str: TWideStringField
      FieldName = 'AuthorisedBy_str'
      Size = 50
    end
    object qryTransfersWorkerRequestedBy_str: TWideStringField
      FieldName = 'RequestedBy_str'
      Size = 50
    end
    object qryTransfersWorkerIssuedBy_str: TWideStringField
      FieldName = 'IssuedBy_str'
      Size = 50
    end
    object qryTransfersWorkerIssuedDate_dat: TDateTimeField
      FieldName = 'IssuedDate_dat'
    end
    object qryTransfersWorkerDemanderFrom_str: TWideStringField
      FieldName = 'DemanderFrom_str'
      Size = 50
    end
    object qryTransfersWorkerDemanderTo_str: TWideStringField
      FieldName = 'DemanderTo_str'
      Size = 50
    end
    object qryTransfersWorkerAuthorisedDate_dat: TDateTimeField
      FieldName = 'AuthorisedDate_dat'
    end
    object qryTransfersWorkerCheckedOut_bol: TBooleanField
      FieldName = 'CheckedOut_bol'
    end
    object qryTransfersWorkerCheckedOutName_str: TWideStringField
      FieldName = 'CheckedOutName_str'
      Size = 30
    end
    object qryTransfersWorkerCheckedOut_dat: TDateTimeField
      FieldName = 'CheckedOut_dat'
    end
    object qryTransfersWorkerCheckedOutBy_ID: TIntegerField
      FieldName = 'CheckedOutBy_ID'
    end
    object qryTransfersWorkerSystemStore_ID: TIntegerField
      FieldName = 'SystemStore_ID'
    end
    object qryTransfersWorkerActive_bol: TBooleanField
      FieldName = 'Active_bol'
    end
    object qryTransfersWorkerRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object qryTransfersWorkerItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
    object qryTransfersWorkerTotalCost_mon: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object qryTransfersWorkerLastEditedBy_ID: TIntegerField
      FieldName = 'LastEditedBy_ID'
    end
    object qryTransfersWorkerUseSKUOnly_bol: TBooleanField
      FieldName = 'UseSKUOnly_bol'
      OnChange = qryTransfersWorkerUseSKUOnly_bolChange
    end
  end
  object dstblTransfers: TDataSource
    DataSet = tblTransfers
    Left = 184
    Top = 104
  end
  object dsTransfersWorker: TDataSource
    DataSet = qryTransfersWorker
    Left = 184
    Top = 168
  end
  object qryTransferItems: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    BeforePost = qryTransferItemsBeforePost
    AfterPost = qryTransferItemsAfterPost
    Parameters = <
      item
        Name = 'DemanderTransferID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     tblDemanderTransferItems.*,  ISNULL(tblDemanderStock.' +
        'QtyOnHandUnits_dbl, 0) AS DemanderSKUOnHand, ISNULL(tblDemanderS' +
        'tock.QtyOnHand_int, 0) AS DemanderPacksOnHand'
      'FROM        tblDemanderTransferItems INNER JOIN'
      '                  tblDemanderTransfer ON '
      
        '                  tblDemanderTransferItems.DemanderTransfer_ID =' +
        ' tblDemanderTransfer.DemanderTransfer_ID LEFT OUTER JOIN'
      
        '                  tblDemanderStock ON tblDemanderTransferItems.P' +
        'roductCode_ID = tblDemanderStock.ProductCode_ID AND '
      
        '                  tblDemanderTransfer.DemanderFrom_ID = tblDeman' +
        'derStock.Demander_ID'
      
        'WHERE tblDemanderTransferItems.DemanderTransfer_ID=:DemanderTran' +
        'sferID')
    Left = 64
    Top = 240
    object qryTransferItemsDemanderTransferItems_ID: TAutoIncField
      FieldName = 'DemanderTransferItems_ID'
      ReadOnly = True
    end
    object qryTransferItemsDemanderTransfer_ID: TIntegerField
      FieldName = 'DemanderTransfer_ID'
    end
    object qryTransferItemsProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object qryTransferItemsECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 14
    end
    object qryTransferItemsICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 14
    end
    object qryTransferItemsNSN_str: TWideStringField
      FieldName = 'NSN_str'
      Size = 14
    end
    object qryTransferItemsDescription_str: TWideStringField
      FieldName = 'Description_str'
      Size = 250
    end
    object qryTransferItemsSKU_dbl: TFloatField
      FieldName = 'SKU_dbl'
    end
    object qryTransferItemsRequestedQty_dbl: TFloatField
      FieldName = 'RequestedQty_dbl'
    end
    object qryTransferItemsPackQty_int: TIntegerField
      FieldName = 'PackQty_int'
    end
    object qryTransferItemsPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
    object qryTransferItemsSKUCost_mon: TBCDField
      FieldName = 'SKUCost_mon'
      Precision = 19
    end
    object qryTransferItemsExtendedCost_mon: TBCDField
      FieldName = 'ExtendedCost_mon'
      Precision = 19
    end
    object qryTransferItemsSKUUnit_str: TWideStringField
      DisplayWidth = 50
      FieldName = 'SKUUnit_str'
      Size = 50
    end
    object qryTransferItemsDemanderSKUOnHand: TFloatField
      FieldName = 'DemanderSKUOnHand'
    end
    object qryTransferItemsDemanderPacksOnHand: TIntegerField
      FieldName = 'DemanderPacksOnHand'
    end
  end
  object dsTransferItems: TDataSource
    DataSet = qryTransferItems
    Left = 184
    Top = 240
  end
  object dsDemandersTo: TDataSource
    DataSet = tblDemandersTo
    Left = 592
    Top = 136
  end
  object tblSystemUsers: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT tblSystem_User.UserID, ISNULL(tblSystem_User.lastName_str' +
        ', N'#39#39') + N'#39', '#39' + ISNULL(tblSystem_User.firstName_str, N'#39#39') + N'#39'(' +
        ' '#39' + ISNULL(tblSystem_User.position_str, N'#39#39') + N'#39' )'#39' AS Descrip' +
        'tion'
      
        'FROM tblSystem_User INNER JOIN tblSystem_User_Access ON tblSyste' +
        'm_User.UserID = tblSystem_User_Access.UserID'
      
        'WHERE (tblSystem_User_Access.moduleNum_int = 28) AND (tblSystem_' +
        'User_Access.accessLevel_int >2) AND (tblSystem_User.Active_bol =' +
        ' 1)'
      
        'ORDER BY tblSystem_User.lastName_str, tblSystem_User.firstName_s' +
        'tr')
    Left = 464
    Top = 80
  end
  object tblDemandersTo: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DemanderID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Demander_ID, Code_str, Name_str, DemanderUnique_ID'
      'FROM tblDemander'
      'WHERE Demander_ID <>:DemanderID'
      'AND Active_bol = 1'
      'ORDER BY Name_str')
    Left = 464
    Top = 136
    object tblDemandersToDemander_ID: TAutoIncField
      FieldName = 'Demander_ID'
      ReadOnly = True
    end
    object tblDemandersToCode_str: TWideStringField
      FieldName = 'Code_str'
      Size = 14
    end
    object tblDemandersToName_str: TWideStringField
      FieldName = 'Name_str'
      Size = 50
    end
    object tblDemandersToDemanderUnique_ID: TGuidField
      FieldName = 'DemanderUnique_ID'
      FixedChar = True
      Size = 38
    end
  end
  object dsUsers: TDataSource
    DataSet = tblSystemUsers
    Left = 592
    Top = 80
  end
  object qryDemanderToUsers: TADOStoredProc
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    ProcedureName = 'strdprc_DemandersUsers;1'
    Parameters = <
      item
        Name = '@DemanderID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 20
      end>
    Left = 464
    Top = 210
  end
  object dsDemanderToUsers: TDataSource
    DataSet = qryDemanderToUsers
    Left = 600
    Top = 208
  end
  object stpSystemWharehouse: TADOTable
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    TableName = 'strdprc_SystemWharehouse'
    Left = 464
    Top = 16
    object stpSystemWharehouseSystemStore_ID: TAutoIncField
      FieldName = 'SystemStore_ID'
      ReadOnly = True
    end
    object stpSystemWharehouseSystemAccount_ID: TAutoIncField
      FieldName = 'SystemAccount_ID'
      ReadOnly = True
    end
    object stpSystemWharehouseDemanderName_str: TWideStringField
      FieldName = 'DemanderName_str'
      Size = 50
    end
    object stpSystemWharehouseDemanderCode_str: TWideStringField
      FieldName = 'DemanderCode_str'
      Size = 10
    end
    object stpSystemWharehouseAccountName_str: TStringField
      FieldName = 'AccountName_str'
      Size = 100
    end
    object stpSystemWharehouseAccount_str: TStringField
      FieldName = 'Account_str'
      Size = 25
    end
    object stpSystemWharehouseDescription: TWideStringField
      FieldName = 'Description'
      ReadOnly = True
      Size = 126
    end
  end
  object dsqryADOSystemWharehouse: TDataSource
    DataSet = stpSystemWharehouse
    Left = 595
    Top = 20
  end
  object ExtraOptions1: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 816
    Top = 16
  end
  object dsDemandersFrom: TDataSource
    DataSet = tblDemandersFrom
    Left = 600
    Top = 280
  end
  object tblDemandersFrom: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Demander_ID, Code_str, Name_str, DemanderUnique_ID'
      'FROM tblDemander'
      'WHERE Active_bol = 1'
      'ORDER BY Name_str')
    Left = 464
    Top = 280
    object tblDemandersFromDemander_ID: TAutoIncField
      FieldName = 'Demander_ID'
      ReadOnly = True
    end
    object tblDemandersFromCode_str: TWideStringField
      FieldName = 'Code_str'
      Size = 14
    end
    object tblDemandersFromName_str: TWideStringField
      FieldName = 'Name_str'
      Size = 50
    end
    object tblDemandersFromDemanderUnique_ID: TGuidField
      FieldName = 'DemanderUnique_ID'
      FixedChar = True
      Size = 38
    end
  end
  object qryDemanderFromUsers: TADOStoredProc
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    ProcedureName = 'strdprc_DemandersUsers;1'
    Parameters = <
      item
        Name = '@DemanderID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 20
      end>
    Left = 464
    Top = 354
    object qryDemanderFromUsersDemanderUser_ID: TAutoIncField
      FieldName = 'DemanderUser_ID'
      ReadOnly = True
    end
    object qryDemanderFromUsersDemander_ID: TIntegerField
      FieldName = 'Demander_ID'
    end
    object qryDemanderFromUsersTitle_str: TStringField
      FieldName = 'Title_str'
      Size = 15
    end
    object qryDemanderFromUsersFirstName_str: TStringField
      FieldName = 'FirstName_str'
    end
    object qryDemanderFromUsersLastName_str: TStringField
      FieldName = 'LastName_str'
      Size = 25
    end
    object qryDemanderFromUsersInitials_str: TStringField
      FieldName = 'Initials_str'
      Size = 5
    end
    object qryDemanderFromUsersPosition_str: TStringField
      FieldName = 'Position_str'
    end
    object qryDemanderFromUsersUserLevel_str: TStringField
      FieldName = 'UserLevel_str'
      Size = 3
    end
    object qryDemanderFromUsersLastUpdated_dat: TDateTimeField
      FieldName = 'LastUpdated_dat'
    end
    object qryDemanderFromUsersPhone_str: TStringField
      FieldName = 'Phone_str'
      Size = 25
    end
    object qryDemanderFromUsersCellPhone_str: TStringField
      FieldName = 'CellPhone_str'
      Size = 25
    end
    object qryDemanderFromUsersFax_str: TStringField
      FieldName = 'Fax_str'
      Size = 25
    end
    object qryDemanderFromUsersEMail_str: TStringField
      FieldName = 'EMail_str'
      Size = 50
    end
    object qryDemanderFromUsersDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 75
    end
    object qryDemanderFromUserspersonDescription_str: TStringField
      FieldName = 'personDescription_str'
      ReadOnly = True
      Size = 71
    end
  end
  object dsDemanderFromUsers: TDataSource
    DataSet = qryDemanderFromUsers
    Left = 608
    Top = 352
  end
  object qryEditHistory: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DemanderTransferID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM tblDemanderTransferEditHistory'
      
        'WHERE tblDemanderTransferEditHistory.DemanderTransfer_ID=:Demand' +
        'erTransferID')
    Left = 64
    Top = 296
    object qryEditHistoryTransferHistory_ID: TAutoIncField
      FieldName = 'TransferHistory_ID'
      ReadOnly = True
    end
    object qryEditHistoryDemanderTransfer_ID: TIntegerField
      FieldName = 'DemanderTransfer_ID'
    end
    object qryEditHistoryDemanderTransferItems_ID: TIntegerField
      FieldName = 'DemanderTransferItems_ID'
    end
    object qryEditHistoryDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 255
    end
    object qryEditHistoryDate_dat: TDateTimeField
      FieldName = 'Date_dat'
    end
    object qryEditHistoryProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object qryEditHistoryType_str: TStringField
      FieldName = 'Type_str'
      Size = 25
    end
    object qryEditHistoryUser_ID: TIntegerField
      FieldName = 'User_ID'
    end
    object qryEditHistoryUserName_str: TStringField
      FieldName = 'UserName_str'
      Size = 75
    end
  end
  object dsEditHistory: TDataSource
    DataSet = qryEditHistory
    Left = 184
    Top = 296
  end
  object ActionList1: TActionList
    Left = 952
    Top = 24
    object atnSaveAndClose: TAction
      Caption = '&Close'
      OnExecute = atnSaveAndCloseExecute
    end
    object atnAddSingleProduct: TAction
      Caption = 'Add (Single Product) '
      OnExecute = atnAddSingleProductExecute
    end
    object atnDeleteAllItems: TAction
      Caption = 'Dele&te (ALL Products from this Transfers)'
      OnExecute = atnDeleteAllItemsExecute
    end
    object atnDeleteSingleItem: TAction
      Caption = '&Delete (selected Product)'
      OnExecute = atnDeleteSingleItemExecute
    end
    object atnAddDemanderFromItems: TAction
      Caption = 'Add Demander (From) Items'
      OnExecute = atnAddDemanderFromItemsExecute
    end
    object DataSetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&First'
      Hint = 'First'
      ImageIndex = 0
      DataSource = dsTransferItems
    end
    object DataSetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Prior'
      Hint = 'Prior'
      ImageIndex = 1
      DataSource = dsTransferItems
    end
    object DataSetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Next'
      Hint = 'Next'
      ImageIndex = 2
      DataSource = dsTransferItems
    end
    object DataSetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&Last'
      Hint = 'Last'
      ImageIndex = 3
      DataSource = dsTransferItems
    end
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dsTransferItems
    end
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dsTransferItems
    end
    object atnPostAndClose: TAction
      Caption = 'Post'
      OnExecute = atnPostAndCloseExecute
    end
    object atnPrintReportMain: TAction
      Caption = 'Print Demander Transfers'
      OnExecute = atnPrintReportMainExecute
    end
    object atnAddDemanderToItems: TAction
      Caption = 'Add Demander (To) Items'
      OnExecute = atnAddDemanderToItemsExecute
    end
    object atnUnLockDemanderTransfer: TAction
      Caption = 'UnLock Demander Transfer'
      OnExecute = atnUnLockDemanderTransferExecute
    end
    object atnUnLockTranfersMain: TAction
      Caption = 'UnLock Tranfers'
      OnExecute = atnUnLockTranfersMainExecute
    end
  end
  object AdoAddSingleItem: TADOCommand
    CommandText = 'strdprc_TransferADD_Single;1'
    CommandType = cmdStoredProc
    Connection = ADODemanderTransfer
    Prepared = True
    Parameters = <
      item
        Name = '@TransferID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ProductCodeID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 464
    Top = 448
  end
  object stpDeleteAllItems: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DemanderTransferID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM tblDemanderTransferItems '
      
        'WHERE tblDemanderTransferItems.DemanderTransfer_ID=:DemanderTran' +
        'sferID')
    Left = 608
    Top = 448
    object AutoIncField2: TAutoIncField
      FieldName = 'DemanderTransferItems_ID'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'DemanderTransfer_ID'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object WideStringField3: TWideStringField
      FieldName = 'ECN_str'
      Size = 14
    end
    object WideStringField4: TWideStringField
      FieldName = 'ICN_str'
      Size = 14
    end
    object WideStringField5: TWideStringField
      FieldName = 'NSN_str'
      Size = 14
    end
    object WideStringField6: TWideStringField
      FieldName = 'Description_str'
      Size = 250
    end
    object FloatField1: TFloatField
      FieldName = 'PackCost_mon'
    end
    object FloatField2: TFloatField
      FieldName = 'ExtendedCost_mon'
    end
    object FloatField3: TFloatField
      FieldName = 'SKU_dbl'
    end
    object FloatField4: TFloatField
      FieldName = 'RequestedQty_dbl'
    end
    object IntegerField3: TIntegerField
      FieldName = 'QtyOnHand_int'
      ReadOnly = True
    end
  end
  object stp_AddDemanderFromItems: TADOStoredProc
    Connection = ADODemanderTransfer
    ProcedureName = 'strdprc_TranferAddDemanderFromItems;1'
    Parameters = <
      item
        Name = '@TransferID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@DemanderID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 464
    Top = 528
  end
  object qryIsDemanderValid: TADOQuery
    Tag = 1
    Connection = ADODemanderTransfer
    Parameters = <
      item
        Name = '@DemanderID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'IF EXISTS ('
      'SELECT Demander_ID FROM tblDemander'
      'WHERE Demander_ID=:@DemanderID)'
      'SELECT 1 AS Result'
      'ELSE '
      'SELECT 0 AS Result')
    Left = 607
    Top = 528
  end
  object ADODemanderTransfer: TADOConnection
    CommandTimeout = 400
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=RxNew;Data Source=(local);'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 32
  end
  object stpStockTransferDemanders: TADOStoredProc
    Tag = 1
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'strdprc_AuditAPPENDDemanderTransfer;1'
    Parameters = <
      item
        Name = '@ProductID'
        Attributes = [paNullable]
        DataType = ftGuid
        Value = Null
      end
      item
        Name = '@DemanderFromUniqueID'
        Attributes = [paNullable]
        DataType = ftGuid
        Value = Null
      end
      item
        Name = '@DemanderToUniqueID'
        Attributes = [paNullable]
        DataType = ftGuid
        Value = Null
      end
      item
        Name = '@Quantity'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@QtyUnits'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Reference'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 225
        Value = Null
      end
      item
        Name = '@User'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 200
        Value = Null
      end
      item
        Name = '@UserID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@VoucherNo'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 225
        Value = Null
      end
      item
        Name = '@itemID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 795
    Top = 254
  end
  object qryProductDetails: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductCodeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT ProductCode_ID, productPackSize_ID, PackSizeValue_dbl, IC' +
        'N_str, ECN_str, Description_str'
      'FROM tblProductPackSize'
      'WHERE tblProductPackSize.ProductCode_ID=:ProductCodeID')
    Left = 792
    Top = 328
    object qryProductDetailsProductCode_ID: TAutoIncField
      FieldName = 'ProductCode_ID'
      ReadOnly = True
    end
    object qryProductDetailsproductPackSize_ID: TGuidField
      FieldName = 'productPackSize_ID'
      FixedChar = True
      Size = 38
    end
    object qryProductDetailsPackSizeValue_dbl: TFloatField
      FieldName = 'PackSizeValue_dbl'
    end
    object qryProductDetailsICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object qryProductDetailsECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object qryProductDetailsDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 250
    end
  end
  object qryUserSpecifiDemanders: TADOStoredProc
    Tag = 1
    ProcedureName = 'stp_RequisitionsUserDemanders;1'
    Parameters = <
      item
        Name = '@DemanderID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 792
    Top = 176
  end
  object dsqryUserSpecifiDemanders: TDataSource
    DataSet = qryUserSpecifiDemanders
    Left = 968
    Top = 168
  end
  object stp_Totals: TADOStoredProc
    Connection = ADODemanderTransfer
    ProcedureName = 'strdprc_StockControlTransfersItemsTotals;1'
    Parameters = <
      item
        Name = '@DemanderTransferID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 792
    Top = 400
    object stp_TotalsCountOfItem_ID: TIntegerField
      FieldName = 'CountOfItem_ID'
      ReadOnly = True
    end
    object stp_TotalsSumOfExtendedCost_mon: TFloatField
      FieldName = 'SumOfExtendedCost_mon'
      ReadOnly = True
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 826
    Top = 598
    Version = '11.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44450
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        UserName = 'DBText21'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderTransferRefNo_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5292
        mmLeft = 23019
        mmTop = 9790
        mmWidth = 55033
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText26'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'Created_dat'
        DataPipeline = ppDBPipeline1
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 23019
        mmTop = 21167
        mmWidth = 55033
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label29'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Items No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 26723
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label30'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 21167
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label32'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 9790
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label104'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 88106
        mmTop = 21167
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label36'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Issued By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 88106
        mmTop = 25665
        mmWidth = 16404
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText27'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'IssuedBy_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 107686
        mmTop = 25665
        mmWidth = 18203
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText28'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'IssuedDate_dat'
        DataPipeline = ppDBPipeline1
        DisplayFormat = 'd-mmm-yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 107686
        mmTop = 30427
        mmWidth = 21442
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText36'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderFrom_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 107686
        mmTop = 21167
        mmWidth = 26755
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText3'
        HyperlinkColor = clBlue
        SaveOrder = 10
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'ItemsNo_int'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 23019
        mmTop = 26723
        mmWidth = 42069
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 36248
        mmWidth = 266436
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 37571
        mmWidth = 266436
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Demander Transfer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7324
        mmLeft = 3440
        mmTop = 0
        mmWidth = 58251
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkColor = clBlue
        SaveOrder = 11
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 219869
        mmTop = 529
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 88106
        mmTop = 30427
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Transfered from'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4784
        mmLeft = 88106
        mmTop = 15875
        mmWidth = 26628
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label64'
        HyperlinkColor = clBlue
        SaveOrder = 12
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Pack Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 171980
        mmTop = 38365
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label67'
        HyperlinkColor = clBlue
        SaveOrder = 13
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 44979
        mmTop = 38365
        mmWidth = 112184
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label68'
        HyperlinkColor = clBlue
        SaveOrder = 14
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ICN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 3704
        mmTop = 38365
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label42'
        HyperlinkColor = clBlue
        SaveOrder = 15
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ECN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 22225
        mmTop = 38365
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        SaveOrder = 16
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'SKU Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 227013
        mmTop = 38365
        mmWidth = 11906
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 43127
        mmWidth = 266436
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Value'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 257969
        mmTop = 38365
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        HyperlinkColor = clBlue
        SaveOrder = 17
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Requested By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 185209
        mmTop = 25665
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText6'
        HyperlinkColor = clBlue
        SaveOrder = 18
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'RequestedBy_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 206905
        mmTop = 25665
        mmWidth = 23855
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        SaveOrder = 19
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'RequestedDate_dat'
        DataPipeline = ppDBPipeline1
        DisplayFormat = 'd-mmm-yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 206905
        mmTop = 30427
        mmWidth = 27093
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 185209
        mmTop = 30427
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        HyperlinkColor = clBlue
        SaveOrder = 20
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tranfered to'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 185209
        mmTop = 15875
        mmWidth = 25665
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText8'
        HyperlinkColor = clBlue
        SaveOrder = 21
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'DemanderTo_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 206905
        mmTop = 21167
        mmWidth = 23051
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Printed: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 202407
        mmTop = 529
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        HyperlinkColor = clBlue
        SaveOrder = 22
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Pack Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 210080
        mmTop = 38100
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        HyperlinkColor = clBlue
        SaveOrder = 23
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 15346
        mmWidth = 18785
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText11'
        HyperlinkColor = clBlue
        SaveOrder = 24
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'Reference_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5292
        mmLeft = 23019
        mmTop = 15346
        mmWidth = 55033
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        HyperlinkColor = clBlue
        SaveOrder = 25
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 185209
        mmTop = 21167
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkColor = clBlue
        SaveOrder = 26
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'SKU Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 193146
        mmTop = 38365
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText12'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'TotalCost_mon'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '$#,0.0000;($#,0.0000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 23019
        mmTop = 31485
        mmWidth = 21146
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        HyperlinkColor = clBlue
        SaveOrder = 27
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Total Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 31485
        mmWidth = 18785
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText56: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ICN_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Anchors = [atLeft, atBottom]
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 44715
        mmTop = 0
        mmWidth = 111390
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText19'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'PackCost_mon'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '$#,0.0000;($#,0.0000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3387
        mmLeft = 168275
        mmTop = 265
        mmWidth = 18119
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText51'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ECN_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4000
        mmLeft = 22225
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText17'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'SKU_dbl'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 226484
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3260
        mmLeft = 529
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText5'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExtendedCost_mon'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '$#,0.0000;($#,0.0000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3387
        mmLeft = 241565
        mmTop = 265
        mmWidth = 23982
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText9'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'PackQty_int'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 211138
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText4'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'SKUCost_mon'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '$#,0.0000;($#,0.0000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3387
        mmLeft = 189971
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLabel68: TppLabel
        UserName = 'Label20'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Demander Transfer Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 47096
        BandType = 8
      end
      object ppDBText94: TppDBText
        UserName = 'DBText10'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderTransferRefNo_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 50800
        mmTop = 1852
        mmWidth = 41540
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable10'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Color = 16383986
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'MS Sans Serif'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 232305
        mmTop = 6615
        mmWidth = 33338
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 266436
        BandType = 8
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExtendedCost_mon'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '$#,0.0000;-$#,0.0000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3387
        mmLeft = 233999
        mmTop = 1588
        mmWidth = 31644
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryTransferReportMain: TADOStoredProc
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    ProcedureName = 'strdprc_TranferReportMain;1'
    Parameters = <
      item
        Name = '@DemanderTransferID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 12
      end>
    Left = 464
    Top = 600
  end
  object dsTransferReportMain: TDataSource
    DataSet = qryTransferReportMain
    Left = 608
    Top = 599
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsTransferReportMain
    UserName = 'DBPipeline1'
    Left = 728
    Top = 592
  end
  object stp_ZeroSKU: TADOQuery
    Connection = ADODemanderTransfer
    Parameters = <
      item
        Name = 'DemanderTransferID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE tblDemanderTransferItems'
      'SET SKU_dbl=0'
      
        'WHERE tblDemanderTransferItems.DemanderTransfer_ID=:DemanderTran' +
        'sferID')
    Left = 192
    Top = 408
  end
  object stp_ZeroPackQty: TADOQuery
    Connection = ADODemanderTransfer
    Parameters = <
      item
        Name = 'DemanderTransferID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE tblDemanderTransferItems'
      'SET PackQty_int=0'
      
        'WHERE tblDemanderTransferItems.DemanderTransfer_ID=:DemanderTran' +
        'sferID')
    Left = 192
    Top = 472
  end
  object stp_AddDemanderToItems: TADOStoredProc
    Connection = ADODemanderTransfer
    ProcedureName = 'strdprc_TranferAddDemanderToItems;1'
    Parameters = <
      item
        Name = '@TransferID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@DemanderID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 792
    Top = 488
  end
  object RemoveUnsedItems: TADOQuery
    Connection = ADODemanderTransfer
    Parameters = <
      item
        Name = 'DemanderTransferID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Delete from tblDemanderTransferItems'
      'WHERE tblDemanderTransferItems.RequestedQty_dbl = 0'
      'AND tblDemanderTransferItems.SKU_dbl  = 0'
      'AND tblDemanderTransferItems.PackQty_int  = 0'
      
        'AND tblDemanderTransferItems.DemanderTransfer_ID=:DemanderTransf' +
        'erID')
    Left = 952
    Top = 408
  end
  object stpCorrectProductPAckSizes: TADOQuery
    Connection = ADODemanderTransfer
    CommandTimeout = 60
    Parameters = <>
    SQL.Strings = (
      'UPDATE tblProductPAckSize'
      'SET PackSizeValue_dbl = 1'
      'WHERE PackSizeValue_dbl = 0'
      'OR PackSizeValue_dbl is NULL')
    Left = 192
    Top = 552
  end
  object qryIsRecordLocked: TADOQuery
    Connection = ADODemanderTransfer
    Parameters = <
      item
        Name = 'DemanderTransfer_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CheckedOut_bol'
      'FROM tblDemanderTransfer'
      'WHERE DemanderTransfer_ID=:DemanderTransfer_ID')
    Left = 960
    Top = 480
  end
  object Stp_DeleteItem: TADOQuery
    Connection = ADODemanderTransfer
    Parameters = <
      item
        Name = 'TransferItem_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM tblDemanderTransferItems'
      'WHERE DemanderTransferItems_ID=:TransferItem_ID')
    Left = 192
    Top = 624
  end
  object qryGeneric_1: TADOQuery
    Connection = ADODemanderTransfer
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductCodeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'SELECT GenericName_str, PackSizeValue_dbl, ShippingPack_int'
      'FROM tblProductPackSize'
      'WHERE ProductCode_ID=:ProductCodeID'
      '')
    Left = 968
    Top = 256
  end
end
