open Xml

let maxrows = 5

let itm addrline = Element
                ("table:table-cell",
                 [("table:style-name", "Table3.A1");
                  ("office:value-type", "string")], Array.to_list (Array.map (fun itm -> Element
                   ("text:p", [("text:style-name", "P3")],
                    [Element
                      ("text:span", [("text:style-name", "T1")],
                       [Element ("text:s", [("text:c", "2")], [])]);
                     Element
                      ("text:span", [("text:style-name", "T4")],
                       [PCData itm])])) (Array.sub addrline 0 maxrows)))

let headitm laddr raddr = Element
             ("table:table-row", [("table:style-name", "Table1.1")],
              [itm laddr;
               Element
                ("table:table-cell",
                 [("table:style-name", "Table1.B1");
                  ("table:number-rows-spanned", "7");
                  ("office:value-type", "string")],
                 [Element ("text:p", [("text:style-name", "P11")], [])]);
                            itm raddr])

let rowitm laddr raddr = Element
             ("table:table-row", [("table:style-name", "Table3.1")],
              [itm laddr;
               Element
                ("table:covered-table-cell",
                 [("table:style-name", "Table3.B7")], []);
               itm raddr])

let templ2 data rows = Element
 ("office:document",
  [("xmlns:css3t", "http://www.w3.org/TR/css3-text/");
   ("xmlns:grddl", "http://www.w3.org/2003/g/data-view#");
   ("xmlns:xhtml", "http://www.w3.org/1999/xhtml");
   ("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance");
   ("xmlns:xsd", "http://www.w3.org/2001/XMLSchema");
   ("xmlns:xforms", "http://www.w3.org/2002/xforms");
   ("xmlns:dom", "http://www.w3.org/2001/xml-events");
   ("xmlns:script", "urn:oasis:names:tc:opendocument:xmlns:script:1.0");
   ("xmlns:form", "urn:oasis:names:tc:opendocument:xmlns:form:1.0");
   ("xmlns:math", "http://www.w3.org/1998/Math/MathML");
   ("xmlns:meta", "urn:oasis:names:tc:opendocument:xmlns:meta:1.0");
   ("xmlns:loext",
    "urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0");
   ("xmlns:field",
    "urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0");
   ("xmlns:number", "urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0");
   ("xmlns:officeooo", "http://openoffice.org/2009/office");
   ("xmlns:table", "urn:oasis:names:tc:opendocument:xmlns:table:1.0");
   ("xmlns:chart", "urn:oasis:names:tc:opendocument:xmlns:chart:1.0");
   ("xmlns:formx",
    "urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0");
   ("xmlns:svg", "urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0");
   ("xmlns:tableooo", "http://openoffice.org/2009/table");
   ("xmlns:draw", "urn:oasis:names:tc:opendocument:xmlns:drawing:1.0");
   ("xmlns:rpt", "http://openoffice.org/2005/report");
   ("xmlns:dr3d", "urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0");
   ("xmlns:of", "urn:oasis:names:tc:opendocument:xmlns:of:1.2");
   ("xmlns:text", "urn:oasis:names:tc:opendocument:xmlns:text:1.0");
   ("xmlns:style", "urn:oasis:names:tc:opendocument:xmlns:style:1.0");
   ("xmlns:dc", "http://purl.org/dc/elements/1.1/");
   ("xmlns:calcext",
    "urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0");
   ("xmlns:oooc", "http://openoffice.org/2004/calc");
   ("xmlns:config", "urn:oasis:names:tc:opendocument:xmlns:config:1.0");
   ("xmlns:ooo", "http://openoffice.org/2004/office");
   ("xmlns:xlink", "http://www.w3.org/1999/xlink");
   ("xmlns:drawooo", "http://openoffice.org/2010/draw");
   ("xmlns:ooow", "http://openoffice.org/2004/writer");
   ("xmlns:fo",
    "urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0");
   ("xmlns:office", "urn:oasis:names:tc:opendocument:xmlns:office:1.0");
   ("office:version", "1.3");
   ("office:mimetype", "application/vnd.oasis.opendocument.text")],
  [Element
    ("office:meta", [],
     [Element
       ("meta:document-statistic",
        [("meta:table-count", "3"); ("meta:image-count", "0");
         ("meta:object-count", "0"); ("meta:page-count", "5");
         ("meta:paragraph-count", "188"); ("meta:word-count", "464");
         ("meta:character-count", "2802");
         ("meta:non-whitespace-character-count", "2124")],
        []);
      Element
       ("meta:generator", [],
        [PCData
          "LibreOffice_Vanilla/7.2.0.4$MacOSX_AARCH64 LibreOffice_project/9a9c6381e3f7a62afc1329bd359cc48accb6435b"])]);
   Element
    ("office:settings", [],
     [Element
       ("config:config-item-set", [("config:name", "ooo:view-settings")],
        [Element
          ("config:config-item",
           [("config:name", "ViewAreaTop"); ("config:type", "long")],
           [PCData "7"]);
         Element
          ("config:config-item",
           [("config:name", "ViewAreaLeft"); ("config:type", "long")],
           [PCData "0"]);
         Element
          ("config:config-item",
           [("config:name", "ViewAreaWidth"); ("config:type", "long")],
           [PCData "28945"]);
         Element
          ("config:config-item",
           [("config:name", "ViewAreaHeight"); ("config:type", "long")],
           [PCData "20712"]);
         Element
          ("config:config-item",
           [("config:name", "ShowRedlineChanges");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "InBrowseMode"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item-map-indexed", [("config:name", "Views")],
           [Element
             ("config:config-item-map-entry", [],
              [Element
                ("config:config-item",
                 [("config:name", "ViewId"); ("config:type", "string")],
                 [PCData "view2"]);
               Element
                ("config:config-item",
                 [("config:name", "ViewLeft"); ("config:type", "long")],
                 [PCData "4914"]);
               Element
                ("config:config-item",
                 [("config:name", "ViewTop"); ("config:type", "long")],
                 [PCData "2344"]);
               Element
                ("config:config-item",
                 [("config:name", "VisibleLeft"); ("config:type", "long")],
                 [PCData "0"]);
               Element
                ("config:config-item",
                 [("config:name", "VisibleTop"); ("config:type", "long")],
                 [PCData "7"]);
               Element
                ("config:config-item",
                 [("config:name", "VisibleRight"); ("config:type", "long")],
                 [PCData "28944"]);
               Element
                ("config:config-item",
                 [("config:name", "VisibleBottom"); ("config:type", "long")],
                 [PCData "20717"]);
               Element
                ("config:config-item",
                 [("config:name", "ZoomType"); ("config:type", "short")],
                 [PCData "0"]);
               Element
                ("config:config-item",
                 [("config:name", "ViewLayoutColumns");
                  ("config:type", "short")],
                 [PCData "1"]);
               Element
                ("config:config-item",
                 [("config:name", "ViewLayoutBookMode");
                  ("config:type", "boolean")],
                 [PCData "false"]);
               Element
                ("config:config-item",
                 [("config:name", "ZoomFactor"); ("config:type", "short")],
                 [PCData "100"]);
               Element
                ("config:config-item",
                 [("config:name", "IsSelectedFrame");
                  ("config:type", "boolean")],
                 [PCData "true"]);
               Element
                ("config:config-item",
                 [("config:name", "KeepRatio"); ("config:type", "boolean")],
                 [PCData "false"]);
               Element
                ("config:config-item",
                 [("config:name", "AnchoredTextOverflowLegacy");
                  ("config:type", "boolean")],
                 [PCData "false"])])])]);
      Element
       ("config:config-item-set",
        [("config:name", "ooo:configuration-settings")],
        [Element
          ("config:config-item",
           [("config:name", "PrintBlackFonts"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrintReversed"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrintAnnotationMode"); ("config:type", "short")],
           [PCData "0"]);
         Element
          ("config:config-item",
           [("config:name", "PrintGraphics"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "EmbeddedDatabaseName");
            ("config:type", "string")],
           []);
         Element
          ("config:config-item",
           [("config:name", "ProtectForm"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrintLeftPages"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "PrintProspect"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrintHiddenText"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrintRightPages"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "PrintFaxName"); ("config:type", "string")], 
           []);
         Element
          ("config:config-item",
           [("config:name", "TabsRelativeToIndent");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "RedlineProtectionKey");
            ("config:type", "base64Binary")],
           []);
         Element
          ("config:config-item",
           [("config:name", "PrintTextPlaceholder");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "Rsid"); ("config:type", "int")],
           [PCData "1429375"]);
         Element
          ("config:config-item",
           [("config:name", "GutterAtTop"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "AddFrameOffsets"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "FrameAutowidthWithMorePara");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "MathBaselineAlignment");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "ProtectBookmarks"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "IgnoreTabsAndBlanksForLineCalculation");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "ContinuousEndnotes");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "FieldAutoUpdate"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "EmptyDbFieldHidesPara");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "ApplyParagraphMarkFormatToNumbering");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "AddParaTableSpacing");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "TabOverSpacing"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "PrintEmptyPages"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "AddParaLineSpacingToTableCells");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "TabOverMargin"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "EmbedAsianScriptFonts");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "EmbedLatinScriptFonts");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "DisableOffPagePositioning");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "EmbedOnlyUsedFonts");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrintControls"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "SaveThumbnail"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "EmbedFonts"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "MsWordCompMinLineHeightByFly");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "SurroundTextWrapSmall");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "BackgroundParaOverDrawings");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "ClippedPictures"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "FloattableNomargins");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "UnbreakableNumberings");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "EmbedSystemFonts"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "TabOverflow"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "PrintTables"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "PrintDrawings"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "ConsiderTextWrapOnObjPos");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "PrintSingleJobs"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "SmallCapsPercentage66");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "CollapseEmptyCellPara");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "HeaderSpacingBelowLastPara");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "RsidRoot"); ("config:type", "int")],
           [PCData "1429375"]);
         Element
          ("config:config-item",
           [("config:name", "PrinterSetup"); ("config:type", "base64Binary")],
           []);
         Element
          ("config:config-item",
           [("config:name", "CurrentDatabaseCommand");
            ("config:type", "string")],
           []);
         Element
          ("config:config-item",
           [("config:name", "AlignTabStopPosition");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "ClipAsCharacterAnchoredWriterFlyFrames");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "DoNotCaptureDrawObjsOnPage");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "SaveGlobalDocumentLinks");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "CurrentDatabaseCommandType");
            ("config:type", "int")],
           [PCData "0"]);
         Element
          ("config:config-item",
           [("config:name", "LoadReadonly"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "DoNotResetParaAttrsForNumFont");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "StylesNoDefault"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "LinkUpdateMode"); ("config:type", "short")],
           [PCData "1"]);
         Element
          ("config:config-item",
           [("config:name", "DoNotJustifyLinesWithManualBreak");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PropLineSpacingShrinksFirstLine");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "TabAtLeftIndentForParagraphsInList");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "ProtectFields"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "UnxForceZeroExtLeading");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "CurrentDatabaseDataSource");
            ("config:type", "string")],
           []);
         Element
          ("config:config-item",
           [("config:name", "UseFormerTextWrapping");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrintPaperFromSetup");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "UseFormerLineSpacing");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "AllowPrintJobCancel");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "SubtractFlysAnchoredAtFlys");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "AddParaSpacingToTableCells");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "AddExternalLeading");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "AddVerticalFrameOffsets");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "TreatSingleColumnBreakAsPageBreak");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "IsLabelDocument"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "MsWordCompTrailingBlanks");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "PrinterPaperFromSetup");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "IgnoreFirstLineIndentInNumbering");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrintPageBackground");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "OutlineLevelYieldsNumbering");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrinterName"); ("config:type", "string")], 
           []);
         Element
          ("config:config-item",
           [("config:name", "IsKernAsianPunctuation");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "PrinterIndependentLayout");
            ("config:type", "string")],
           [PCData "high-resolution"]);
         Element
          ("config:config-item",
           [("config:name", "TableRowKeep"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "UpdateFromTemplate");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "EmbedComplexScriptFonts");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "UseOldPrinterMetrics");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "InvertBorderSpacing");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "PrintProspectRTL"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "ApplyUserData"); ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "AddParaTableSpacingAtStart");
            ("config:type", "boolean")],
           [PCData "true"]);
         Element
          ("config:config-item",
           [("config:name", "SaveVersionOnClose");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "CharacterCompressionType");
            ("config:type", "short")],
           [PCData "0"]);
         Element
          ("config:config-item",
           [("config:name", "UseOldNumbering"); ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "UseFormerObjectPositioning");
            ("config:type", "boolean")],
           [PCData "false"]);
         Element
          ("config:config-item",
           [("config:name", "ChartAutoUpdate"); ("config:type", "boolean")],
           [PCData "true"])])]);
   Element
    ("office:scripts", [],
     [Element
       ("office:script", [("script:language", "ooo:Basic")],
        [Element
          ("ooo:libraries",
           [("xmlns:ooo", "http://openoffice.org/2004/office");
            ("xmlns:xlink", "http://www.w3.org/1999/xlink")],
           [Element ("ooo:library-embedded", [("ooo:name", "Standard")], [])])])]);
   Element
    ("office:font-face-decls", [],
     [Element
       ("style:font-face",
        [("style:name", "Arial"); ("svg:font-family", "Arial");
         ("style:font-family-generic", "roman");
         ("style:font-pitch", "variable")],
        []);
      Element
       ("style:font-face",
        [("style:name", "Arial Unicode MS");
         ("svg:font-family", "&apos;Arial Unicode MS&apos;");
         ("style:font-family-generic", "system");
         ("style:font-pitch", "variable")],
        []);
      Element
       ("style:font-face",
        [("style:name", "Arial Unicode MS1");
         ("svg:font-family", "&apos;Arial Unicode MS&apos;");
         ("style:font-family-generic", "swiss")],
        []);
      Element
       ("style:font-face",
        [("style:name", "Calibri"); ("svg:font-family", "Calibri");
         ("style:font-family-generic", "roman");
         ("style:font-pitch", "variable")],
        []);
      Element
       ("style:font-face",
        [("style:name", "Helvetica Neue");
         ("svg:font-family", "&apos;Helvetica Neue&apos;");
         ("style:font-family-generic", "roman");
         ("style:font-pitch", "variable")],
        []);
      Element
       ("style:font-face",
        [("style:name", "Liberation Sans");
         ("svg:font-family", "&apos;Liberation Sans&apos;");
         ("style:font-family-generic", "swiss");
         ("style:font-pitch", "variable")],
        []);
      Element
       ("style:font-face",
        [("style:name", "PingFang SC");
         ("svg:font-family", "&apos;PingFang SC&apos;");
         ("style:font-family-generic", "system");
         ("style:font-pitch", "variable")],
        []);
      Element
       ("style:font-face",
        [("style:name", "Times New Roman");
         ("svg:font-family", "&apos;Times New Roman&apos;");
         ("style:font-family-generic", "roman");
         ("style:font-pitch", "variable")],
        []);
      Element
       ("style:font-face",
        [("style:name", "Times New Roman1");
         ("svg:font-family", "&apos;Times New Roman&apos;");
         ("style:font-family-generic", "system");
         ("style:font-pitch", "variable")],
        [])]);
   Element
    ("office:styles", [],
     [Element
       ("style:default-style", [("style:family", "graphic")],
        [Element
          ("style:graphic-properties",
           [("svg:stroke-color", "#3465a4"); ("draw:fill-color", "#729fcf");
            ("fo:wrap-option", "no-wrap"); ("draw:shadow-offset-x", "0.3cm");
            ("draw:shadow-offset-y", "0.3cm");
            ("draw:start-line-spacing-horizontal", "0.283cm");
            ("draw:start-line-spacing-vertical", "0.283cm");
            ("draw:end-line-spacing-horizontal", "0.283cm");
            ("draw:end-line-spacing-vertical", "0.283cm");
            ("style:flow-with-text", "false")],
           []);
         Element
          ("style:paragraph-properties",
           [("style:text-autospace", "ideograph-alpha");
            ("style:line-break", "strict"); ("style:writing-mode", "lr-tb");
            ("style:font-independent-line-spacing", "false")],
           [Element ("style:tab-stops", [], [])]);
         Element
          ("style:text-properties",
           [("fo:font-variant", "normal"); ("fo:text-transform", "none");
            ("style:use-window-font-color", "true"); ("loext:opacity", "0%");
            ("style:text-outline", "false");
            ("style:text-line-through-style", "none");
            ("style:text-line-through-type", "none");
            ("style:text-position", "0% 100%");
            ("style:font-name", "Times New Roman"); ("fo:font-size", "10pt");
            ("fo:letter-spacing", "normal"); ("fo:language", "en");
            ("fo:country", "GB"); ("fo:font-style", "normal");
            ("style:text-underline-style", "none");
            ("fo:font-weight", "normal"); ("style:letter-kerning", "false");
            ("style:font-name-asian", "Arial Unicode MS");
            ("style:font-size-asian", "10pt");
            ("style:language-asian", "zh"); ("style:country-asian", "CN");
            ("style:font-style-asian", "normal");
            ("style:font-weight-asian", "normal");
            ("style:font-name-complex", "Times New Roman1");
            ("style:font-size-complex", "10pt");
            ("style:language-complex", "hi");
            ("style:country-complex", "IN");
            ("style:font-style-complex", "normal");
            ("style:font-weight-complex", "normal");
            ("style:text-scale", "100%"); ("style:font-relief", "none")],
           [])]);
      Element
       ("style:default-style", [("style:family", "paragraph")],
        [Element
          ("style:paragraph-properties",
           [("fo:hyphenation-ladder-count", "no-limit");
            ("style:text-autospace", "ideograph-alpha");
            ("style:punctuation-wrap", "hanging");
            ("style:line-break", "strict");
            ("style:tab-stop-distance", "1.249cm");
            ("style:writing-mode", "page")],
           []);
         Element
          ("style:text-properties",
           [("fo:font-variant", "normal"); ("fo:text-transform", "none");
            ("style:use-window-font-color", "true"); ("loext:opacity", "0%");
            ("style:text-outline", "false");
            ("style:text-line-through-style", "none");
            ("style:text-line-through-type", "none");
            ("style:text-position", "0% 100%");
            ("style:font-name", "Times New Roman"); ("fo:font-size", "10pt");
            ("fo:letter-spacing", "normal"); ("fo:language", "en");
            ("fo:country", "GB"); ("fo:font-style", "normal");
            ("style:text-underline-style", "none");
            ("fo:font-weight", "normal"); ("style:letter-kerning", "false");
            ("style:font-name-asian", "Arial Unicode MS");
            ("style:font-size-asian", "10pt");
            ("style:language-asian", "zh"); ("style:country-asian", "CN");
            ("style:font-style-asian", "normal");
            ("style:font-weight-asian", "normal");
            ("style:font-name-complex", "Times New Roman1");
            ("style:font-size-complex", "10pt");
            ("style:language-complex", "hi");
            ("style:country-complex", "IN");
            ("style:font-style-complex", "normal");
            ("style:font-weight-complex", "normal");
            ("style:text-scale", "100%"); ("style:font-relief", "none");
            ("text:display", "true"); ("loext:padding", "0cm");
            ("loext:border", "none"); ("loext:shadow", "none");
            ("fo:hyphenate", "false");
            ("fo:hyphenation-remain-char-count", "2");
            ("fo:hyphenation-push-char-count", "2");
            ("loext:hyphenation-no-caps", "false")],
           [])]);
      Element
       ("style:default-style", [("style:family", "table")],
        [Element
          ("style:table-properties", [("table:border-model", "collapsing")],
           [])]);
      Element
       ("style:default-style", [("style:family", "table-row")],
        [Element
          ("style:table-row-properties", [("fo:keep-together", "auto")], [])]);
      Element
       ("style:style",
        [("style:name", "Standard"); ("style:family", "paragraph");
         ("style:default-outline-level", ""); ("style:class", "text")],
        [Element
          ("loext:graphic-properties",
           [("draw:fill", "none"); ("draw:fill-color", "#ffffff")], []);
         Element
          ("style:paragraph-properties",
           [("fo:margin-left", "0cm"); ("fo:margin-right", "0cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "100%"); ("fo:text-align", "start");
            ("style:justify-single-word", "false");
            ("fo:keep-together", "auto"); ("fo:orphans", "2");
            ("fo:widows", "2"); ("fo:hyphenation-ladder-count", "no-limit");
            ("fo:text-indent", "0cm"); ("style:auto-text-indent", "false");
            ("fo:break-before", "auto"); ("fo:break-after", "auto");
            ("fo:background-color", "transparent"); ("fo:padding", "0cm");
            ("fo:border", "none"); ("style:shadow", "none");
            ("fo:keep-with-next", "auto"); ("text:number-lines", "true");
            ("text:line-number", "0"); ("style:writing-mode", "lr-tb")],
           []);
         Element
          ("style:text-properties",
           [("fo:font-size", "12pt"); ("fo:language", "en");
            ("fo:country", "US"); ("style:font-size-asian", "12pt");
            ("style:language-asian", "en"); ("style:country-asian", "US");
            ("style:font-size-complex", "12pt");
            ("style:language-complex", "ar");
            ("style:country-complex", "SA"); ("fo:hyphenate", "true");
            ("fo:hyphenation-remain-char-count", "2");
            ("fo:hyphenation-push-char-count", "2");
            ("loext:hyphenation-no-caps", "false")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Heading"); ("style:family", "paragraph");
         ("style:parent-style-name", "Standard");
         ("style:next-style-name", "Text_20_body"); ("style:class", "text")],
        [Element
          ("style:paragraph-properties",
           [("fo:margin-top", "0.423cm"); ("fo:margin-bottom", "0.212cm");
            ("style:contextual-spacing", "false");
            ("fo:keep-with-next", "always")],
           []);
         Element
          ("style:text-properties",
           [("style:font-name", "Liberation Sans");
            ("fo:font-family", "&apos;Liberation Sans&apos;");
            ("style:font-family-generic", "swiss");
            ("style:font-pitch", "variable"); ("fo:font-size", "14pt");
            ("style:font-name-asian", "PingFang SC");
            ("style:font-family-asian", "&apos;PingFang SC&apos;");
            ("style:font-family-generic-asian", "system");
            ("style:font-pitch-asian", "variable");
            ("style:font-size-asian", "14pt");
            ("style:font-name-complex", "Arial Unicode MS");
            ("style:font-family-complex", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-complex", "system");
            ("style:font-pitch-complex", "variable");
            ("style:font-size-complex", "14pt")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Text_20_body"); ("style:display-name", "Text body");
         ("style:family", "paragraph");
         ("style:parent-style-name", "Standard"); ("style:class", "text")],
        [Element
          ("style:paragraph-properties",
           [("fo:margin-top", "0cm"); ("fo:margin-bottom", "0.247cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "115%")],
           [])]);
      Element
       ("style:style",
        [("style:name", "List"); ("style:family", "paragraph");
         ("style:parent-style-name", "Text_20_body");
         ("style:class", "list")],
        [Element
          ("style:text-properties",
           [("style:font-size-asian", "12pt");
            ("style:font-name-complex", "Arial Unicode MS1");
            ("style:font-family-complex", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-complex", "swiss")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Caption"); ("style:family", "paragraph");
         ("style:parent-style-name", "Standard"); ("style:class", "extra")],
        [Element
          ("style:paragraph-properties",
           [("fo:margin-top", "0.212cm"); ("fo:margin-bottom", "0.212cm");
            ("style:contextual-spacing", "false");
            ("text:number-lines", "false"); ("text:line-number", "0")],
           []);
         Element
          ("style:text-properties",
           [("fo:font-size", "12pt"); ("fo:font-style", "italic");
            ("style:font-size-asian", "12pt");
            ("style:font-style-asian", "italic");
            ("style:font-name-complex", "Arial Unicode MS1");
            ("style:font-family-complex", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-complex", "swiss");
            ("style:font-size-complex", "12pt");
            ("style:font-style-complex", "italic")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Index"); ("style:family", "paragraph");
         ("style:parent-style-name", "Standard"); ("style:class", "index")],
        [Element
          ("style:paragraph-properties",
           [("text:number-lines", "false"); ("text:line-number", "0")], 
           []);
         Element
          ("style:text-properties",
           [("fo:language", "zxx"); ("fo:country", "none");
            ("style:font-size-asian", "12pt");
            ("style:language-asian", "zxx"); ("style:country-asian", "none");
            ("style:font-name-complex", "Arial Unicode MS1");
            ("style:font-family-complex", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-complex", "swiss");
            ("style:language-complex", "zxx");
            ("style:country-complex", "none")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Header_20__26__20_Footer");
         ("style:display-name", "Header &amp; Footer");
         ("style:family", "paragraph"); ("style:default-outline-level", "")],
        [Element
          ("loext:graphic-properties",
           [("draw:fill", "none"); ("draw:fill-color", "#ffffff")], []);
         Element
          ("style:paragraph-properties",
           [("fo:margin-left", "0cm"); ("fo:margin-right", "0cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "100%"); ("fo:text-align", "start");
            ("style:justify-single-word", "false");
            ("fo:keep-together", "auto"); ("fo:orphans", "2");
            ("fo:widows", "2"); ("fo:hyphenation-ladder-count", "no-limit");
            ("fo:text-indent", "0cm"); ("style:auto-text-indent", "false");
            ("fo:break-before", "auto"); ("fo:break-after", "auto");
            ("fo:background-color", "transparent"); ("fo:padding", "0cm");
            ("fo:border", "none"); ("style:shadow", "none");
            ("fo:keep-with-next", "auto"); ("text:number-lines", "true");
            ("text:line-number", "0"); ("style:writing-mode", "lr-tb")],
           [Element
             ("style:tab-stops", [],
              [Element
                ("style:tab-stop",
                 [("style:position", "15.91cm"); ("style:type", "right")],
                 [])])]);
         Element
          ("style:text-properties",
           [("fo:font-variant", "normal"); ("fo:text-transform", "none");
            ("fo:color", "#000000"); ("loext:opacity", "100%");
            ("style:text-outline", "false");
            ("style:text-line-through-style", "none");
            ("style:text-line-through-type", "none");
            ("style:text-position", "0% 100%");
            ("style:font-name", "Helvetica Neue");
            ("fo:font-family", "&apos;Helvetica Neue&apos;");
            ("style:font-family-generic", "roman");
            ("style:font-pitch", "variable"); ("fo:font-size", "12pt");
            ("fo:letter-spacing", "normal"); ("fo:font-style", "normal");
            ("style:text-underline-style", "none");
            ("fo:font-weight", "normal"); ("style:letter-kerning", "false");
            ("fo:background-color", "transparent");
            ("style:font-name-asian", "Arial Unicode MS");
            ("style:font-family-asian", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-asian", "system");
            ("style:font-pitch-asian", "variable");
            ("style:font-size-asian", "12pt");
            ("style:font-style-asian", "normal");
            ("style:font-weight-asian", "normal");
            ("style:font-name-complex", "Arial Unicode MS");
            ("style:font-family-complex", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-complex", "system");
            ("style:font-pitch-complex", "variable");
            ("style:font-size-complex", "12pt");
            ("style:font-style-complex", "normal");
            ("style:font-weight-complex", "normal");
            ("fo:hyphenate", "true");
            ("fo:hyphenation-remain-char-count", "2");
            ("fo:hyphenation-push-char-count", "2");
            ("loext:hyphenation-no-caps", "false")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Body"); ("style:family", "paragraph");
         ("style:default-outline-level", "")],
        [Element
          ("loext:graphic-properties",
           [("draw:fill", "none"); ("draw:fill-color", "#ffffff")], []);
         Element
          ("style:paragraph-properties",
           [("fo:margin-left", "0cm"); ("fo:margin-right", "0cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0.353cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "115%"); ("fo:text-align", "start");
            ("style:justify-single-word", "false");
            ("fo:keep-together", "auto"); ("fo:orphans", "2");
            ("fo:widows", "2"); ("fo:hyphenation-ladder-count", "no-limit");
            ("fo:text-indent", "0cm"); ("style:auto-text-indent", "false");
            ("fo:break-before", "auto"); ("fo:break-after", "auto");
            ("fo:background-color", "transparent"); ("fo:padding", "0cm");
            ("fo:border", "none"); ("style:shadow", "none");
            ("fo:keep-with-next", "auto"); ("text:number-lines", "true");
            ("text:line-number", "0"); ("style:writing-mode", "lr-tb")],
           []);
         Element
          ("style:text-properties",
           [("fo:font-variant", "normal"); ("fo:text-transform", "none");
            ("fo:color", "#000000"); ("loext:opacity", "100%");
            ("style:text-outline", "false");
            ("style:text-line-through-style", "none");
            ("style:text-line-through-type", "none");
            ("style:text-position", "0% 100%");
            ("style:font-name", "Calibri"); ("fo:font-family", "Calibri");
            ("style:font-family-generic", "roman");
            ("style:font-pitch", "variable"); ("fo:font-size", "11pt");
            ("fo:letter-spacing", "normal"); ("fo:font-style", "normal");
            ("style:text-underline-style", "none");
            ("fo:font-weight", "normal"); ("style:letter-kerning", "false");
            ("fo:background-color", "transparent");
            ("style:font-name-asian", "Arial Unicode MS");
            ("style:font-family-asian", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-asian", "system");
            ("style:font-pitch-asian", "variable");
            ("style:font-size-asian", "11pt");
            ("style:font-style-asian", "normal");
            ("style:font-weight-asian", "normal");
            ("style:font-name-complex", "Arial Unicode MS");
            ("style:font-family-complex", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-complex", "system");
            ("style:font-pitch-complex", "variable");
            ("style:font-size-complex", "11pt");
            ("style:font-style-complex", "normal");
            ("style:font-weight-complex", "normal");
            ("fo:hyphenate", "true");
            ("fo:hyphenation-remain-char-count", "2");
            ("fo:hyphenation-push-char-count", "2");
            ("loext:hyphenation-no-caps", "false")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Avery_20_Style_20_1");
         ("style:display-name", "Avery Style 1");
         ("style:family", "paragraph"); ("style:default-outline-level", "")],
        [Element
          ("loext:graphic-properties",
           [("draw:fill", "none"); ("draw:fill-color", "#ffffff")], []);
         Element
          ("style:paragraph-properties",
           [("fo:margin-left", "0.372cm"); ("fo:margin-right", "0.369cm");
            ("fo:margin-top", "0.101cm"); ("fo:margin-bottom", "0.101cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "115%"); ("fo:text-align", "start");
            ("style:justify-single-word", "false");
            ("fo:keep-together", "auto"); ("fo:orphans", "2");
            ("fo:widows", "2"); ("fo:hyphenation-ladder-count", "no-limit");
            ("fo:text-indent", "0cm"); ("style:auto-text-indent", "false");
            ("fo:break-before", "auto"); ("fo:break-after", "auto");
            ("fo:background-color", "transparent"); ("fo:padding", "0cm");
            ("fo:border", "none"); ("style:shadow", "none");
            ("fo:keep-with-next", "auto"); ("text:number-lines", "true");
            ("text:line-number", "0"); ("style:writing-mode", "lr-tb")],
           []);
         Element
          ("style:text-properties",
           [("fo:font-variant", "normal"); ("fo:text-transform", "none");
            ("fo:color", "#000000"); ("loext:opacity", "100%");
            ("style:text-outline", "false");
            ("style:text-line-through-style", "none");
            ("style:text-line-through-type", "none");
            ("style:text-position", "0% 100%"); ("style:font-name", "Arial");
            ("fo:font-family", "Arial");
            ("style:font-family-generic", "roman");
            ("style:font-pitch", "variable"); ("fo:font-size", "12pt");
            ("fo:letter-spacing", "normal");
            ("style:rfc-language-tag", "es-ES-u-co-trad");
            ("fo:language", "es"); ("fo:country", "ES");
            ("fo:font-style", "normal");
            ("style:text-underline-style", "none");
            ("fo:font-weight", "normal"); ("style:letter-kerning", "false");
            ("fo:background-color", "transparent");
            ("style:font-name-asian", "Arial Unicode MS");
            ("style:font-family-asian", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-asian", "system");
            ("style:font-pitch-asian", "variable");
            ("style:font-size-asian", "12pt");
            ("style:font-style-asian", "normal");
            ("style:font-weight-asian", "normal");
            ("style:font-name-complex", "Arial Unicode MS");
            ("style:font-family-complex", "&apos;Arial Unicode MS&apos;");
            ("style:font-family-generic-complex", "system");
            ("style:font-pitch-complex", "variable");
            ("style:font-size-complex", "12pt");
            ("style:font-style-complex", "normal");
            ("style:font-weight-complex", "normal");
            ("fo:hyphenate", "true");
            ("fo:hyphenation-remain-char-count", "2");
            ("fo:hyphenation-push-char-count", "2");
            ("loext:hyphenation-no-caps", "false")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Header_20_and_20_Footer");
         ("style:display-name", "Header and Footer");
         ("style:family", "paragraph");
         ("style:parent-style-name", "Standard"); ("style:class", "extra")],
        []);
      Element
       ("style:style",
        [("style:name", "Header"); ("style:family", "paragraph");
         ("style:parent-style-name", "Header_20_and_20_Footer");
         ("style:class", "extra")],
        []);
      Element
       ("style:style",
        [("style:name", "Footer"); ("style:family", "paragraph");
         ("style:parent-style-name", "Header_20_and_20_Footer");
         ("style:class", "extra")],
        []);
      Element
       ("style:style",
        [("style:name", "Default_20_Paragraph_20_Font");
         ("style:display-name", "Default Paragraph Font");
         ("style:family", "text")],
        []);
      Element
       ("style:style",
        [("style:name", "Internet_20_link");
         ("style:display-name", "Internet link"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("style:text-underline-style", "solid");
            ("style:text-underline-width", "auto");
            ("style:text-underline-color", "#ffffff")],
           [])]);
      Element
       ("text:outline-style", [("style:name", "Outline")],
        [Element
          ("text:outline-level-style",
           [("text:level", "1"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])]);
         Element
          ("text:outline-level-style",
           [("text:level", "2"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])]);
         Element
          ("text:outline-level-style",
           [("text:level", "3"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])]);
         Element
          ("text:outline-level-style",
           [("text:level", "4"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])]);
         Element
          ("text:outline-level-style",
           [("text:level", "5"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])]);
         Element
          ("text:outline-level-style",
           [("text:level", "6"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])]);
         Element
          ("text:outline-level-style",
           [("text:level", "7"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])]);
         Element
          ("text:outline-level-style",
           [("text:level", "8"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])]);
         Element
          ("text:outline-level-style",
           [("text:level", "9"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])]);
         Element
          ("text:outline-level-style",
           [("text:level", "10"); ("style:num-format", "")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab")], [])])])]);
      Element
       ("text:list-style",
        [("style:name", "No_20_List"); ("style:display-name", "No List")],
        [Element
          ("text:list-level-style-number",
           [("text:level", "1"); ("loext:num-list-format", "%1%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "1.27cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "1.27cm")],
                 [])])]);
         Element
          ("text:list-level-style-number",
           [("text:level", "2"); ("loext:num-list-format", "%2%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "1.905cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "1.905cm")],
                 [])])]);
         Element
          ("text:list-level-style-number",
           [("text:level", "3"); ("loext:num-list-format", "%3%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "2.54cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "2.54cm")],
                 [])])]);
         Element
          ("text:list-level-style-number",
           [("text:level", "4"); ("loext:num-list-format", "%4%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "3.175cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "3.175cm")],
                 [])])]);
         Element
          ("text:list-level-style-number",
           [("text:level", "5"); ("loext:num-list-format", "%5%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "3.81cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "3.81cm")],
                 [])])]);
         Element
          ("text:list-level-style-number",
           [("text:level", "6"); ("loext:num-list-format", "%6%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "4.445cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "4.445cm")],
                 [])])]);
         Element
          ("text:list-level-style-number",
           [("text:level", "7"); ("loext:num-list-format", "%7%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "5.08cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "5.08cm")],
                 [])])]);
         Element
          ("text:list-level-style-number",
           [("text:level", "8"); ("loext:num-list-format", "%8%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "5.715cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "5.715cm")],
                 [])])]);
         Element
          ("text:list-level-style-number",
           [("text:level", "9"); ("loext:num-list-format", "%9%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "6.35cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "6.35cm")],
                 [])])]);
         Element
          ("text:list-level-style-number",
           [("text:level", "10"); ("loext:num-list-format", "%10%.");
            ("style:num-suffix", "."); ("style:num-format", "1")],
           [Element
             ("style:list-level-properties",
              [("text:list-level-position-and-space-mode", "label-alignment")],
              [Element
                ("style:list-level-label-alignment",
                 [("text:label-followed-by", "listtab");
                  ("text:list-tab-stop-position", "6.985cm");
                  ("fo:text-indent", "-0.635cm");
                  ("fo:margin-left", "6.985cm")],
                 [])])])]);
      Element
       ("text:notes-configuration",
        [("text:note-class", "footnote"); ("style:num-format", "1");
         ("text:start-value", "0"); ("text:footnotes-position", "page");
         ("text:start-numbering-at", "document")],
        []);
      Element
       ("text:notes-configuration",
        [("text:note-class", "endnote"); ("style:num-format", "i");
         ("text:start-value", "0")],
        []);
      Element
       ("text:linenumbering-configuration",
        [("text:number-lines", "false"); ("text:offset", "0.499cm");
         ("style:num-format", "1"); ("text:number-position", "left");
         ("text:increment", "5")],
        []);
      Element
       ("style:default-page-layout", [],
        [Element
          ("style:page-layout-properties",
           [("style:layout-grid-standard-mode", "true")], [])])]);
   Element
    ("office:automatic-styles", [],
     [Element
       ("style:style",
        [("style:name", "Table1"); ("style:family", "table");
         ("style:master-page-name", "Standard")],
        [Element
          ("style:table-properties",
           [("style:width", "20.066cm"); ("fo:margin-left", "0.191cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("style:page-number", "1"); ("table:align", "left");
            ("style:writing-mode", "lr-tb")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Table1.A"); ("style:family", "table-column")],
        [Element
          ("style:table-column-properties",
           [("style:column-width", "9.878cm")], [])]);
      Element
       ("style:style",
        [("style:name", "Table1.B"); ("style:family", "table-column")],
        [Element
          ("style:table-column-properties",
           [("style:column-width", "0.28cm")], [])]);
      Element
       ("style:style",
        [("style:name", "Table1.C"); ("style:family", "table-column")],
        [Element
          ("style:table-column-properties",
           [("style:column-width", "9.908cm")], [])]);
      Element
       ("style:style",
        [("style:name", "Table1.1"); ("style:family", "table-row")],
        [Element
          ("style:table-row-properties",
           [("style:row-height", "3.6cm"); ("fo:keep-together", "auto")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Table1.A1"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("style:vertical-align", "middle");
            ("fo:background-color", "transparent");
            ("fo:padding-left", "0.141cm"); ("fo:padding-right", "0.51cm");
            ("fo:padding-top", "0.141cm"); ("fo:padding-bottom", "0.141cm");
            ("fo:border", "none")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table1.B1"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("style:vertical-align", "");
            ("fo:background-color", "transparent");
            ("fo:padding", "0.141cm"); ("fo:border-left", "none");
            ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table1.B2"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table1.B3"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table1.B4"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table1.B5"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table1.B6"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table1.B7"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table2"); ("style:family", "table");
         ("style:master-page-name", "Converted1")],
        [Element
          ("style:table-properties",
           [("style:width", "20.066cm"); ("fo:margin-left", "0.191cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("style:page-number", "1"); ("table:align", "left");
            ("style:writing-mode", "lr-tb")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Table2.A"); ("style:family", "table-column")],
        [Element
          ("style:table-column-properties",
           [("style:column-width", "9.878cm")], [])]);
      Element
       ("style:style",
        [("style:name", "Table2.B"); ("style:family", "table-column")],
        [Element
          ("style:table-column-properties",
           [("style:column-width", "0.28cm")], [])]);
      Element
       ("style:style",
        [("style:name", "Table2.C"); ("style:family", "table-column")],
        [Element
          ("style:table-column-properties",
           [("style:column-width", "9.908cm")], [])]);
      Element
       ("style:style",
        [("style:name", "Table2.1"); ("style:family", "table-row")],
        [Element
          ("style:table-row-properties",
           [("style:row-height", "3.563cm"); ("fo:keep-together", "auto")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Table2.A1"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("style:vertical-align", "middle");
            ("fo:background-color", "transparent");
            ("fo:padding-left", "0.141cm"); ("fo:padding-right", "0.51cm");
            ("fo:padding-top", "0.141cm"); ("fo:padding-bottom", "0.141cm");
            ("fo:border", "none")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table2.B1"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("style:vertical-align", "");
            ("fo:background-color", "transparent");
            ("fo:padding", "0.141cm"); ("fo:border-left", "none");
            ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table2.B2"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table2.B3"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table2.B4"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table2.B5"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table2.B6"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table2.B7"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table3"); ("style:family", "table");
         ("style:master-page-name", "Converted2")],
        [Element
          ("style:table-properties",
           [("style:width", "20.066cm"); ("fo:margin-left", "0.191cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("style:page-number", "1"); ("table:align", "left");
            ("style:writing-mode", "lr-tb")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Table3.A"); ("style:family", "table-column")],
        [Element
          ("style:table-column-properties",
           [("style:column-width", "9.878cm")], [])]);
      Element
       ("style:style",
        [("style:name", "Table3.B"); ("style:family", "table-column")],
        [Element
          ("style:table-column-properties",
           [("style:column-width", "0.28cm")], [])]);
      Element
       ("style:style",
        [("style:name", "Table3.C"); ("style:family", "table-column")],
        [Element
          ("style:table-column-properties",
           [("style:column-width", "9.908cm")], [])]);
      Element
       ("style:style",
        [("style:name", "Table3.1"); ("style:family", "table-row")],
        [Element
          ("style:table-row-properties",
           [("style:row-height", "3.8cm"); ("fo:keep-together", "auto")],
           [])]);
      Element
       ("style:style",
        [("style:name", "Table3.A1"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("style:vertical-align", "middle");
            ("fo:background-color", "transparent");
            ("fo:padding-left", "0.141cm"); ("fo:padding-right", "0.51cm");
            ("fo:padding-top", "0.141cm"); ("fo:padding-bottom", "0.141cm");
            ("fo:border", "none")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table3.B1"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("style:vertical-align", "");
            ("fo:background-color", "transparent");
            ("fo:padding", "0.141cm"); ("fo:border-left", "none");
            ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table3.B2"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table3.B3"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table3.B4"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table3.B5"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table3.B6"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "Table3.B7"); ("style:family", "table-cell")],
        [Element
          ("style:table-cell-properties",
           [("fo:background-color", "transparent");
            ("fo:padding-left", "0.191cm"); ("fo:padding-right", "0.191cm");
            ("fo:padding-top", "0cm"); ("fo:padding-bottom", "0cm");
            ("fo:border-left", "none"); ("fo:border-right", "none");
            ("fo:border-top", "1pt solid #ffffff");
            ("fo:border-bottom", "1pt solid #ffffff")],
           [Element ("style:background-image", [], [])])]);
      Element
       ("style:style",
        [("style:name", "P1"); ("style:family", "paragraph");
         ("style:parent-style-name", "Header_20__26__20_Footer")],
        [Element
          ("style:paragraph-properties", [("style:writing-mode", "lr-tb")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P2"); ("style:family", "paragraph");
         ("style:parent-style-name", "Header_20__26__20_Footer")],
        [Element
          ("style:paragraph-properties",
           [("fo:break-before", "page"); ("style:writing-mode", "lr-tb")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P3"); ("style:family", "paragraph");
         ("style:parent-style-name", "Avery_20_Style_20_1")],
        [Element
          ("style:paragraph-properties",
           [("fo:margin-left", "0cm"); ("fo:margin-right", "0.369cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0.101cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "100%"); ("fo:orphans", "0");
            ("fo:widows", "0"); ("fo:text-indent", "0cm");
            ("style:auto-text-indent", "false")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P4"); ("style:family", "paragraph");
         ("style:parent-style-name", "Avery_20_Style_20_1")],
        [Element
          ("style:paragraph-properties",
           [("fo:margin-left", "0cm"); ("fo:margin-right", "0.369cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0.101cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "100%"); ("fo:text-align", "start");
            ("style:justify-single-word", "false"); ("fo:orphans", "0");
            ("fo:widows", "0"); ("fo:text-indent", "0cm");
            ("style:auto-text-indent", "false");
            ("style:writing-mode", "lr-tb")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P5"); ("style:family", "paragraph");
         ("style:parent-style-name", "Avery_20_Style_20_1")],
        [Element
          ("style:paragraph-properties",
           [("fo:margin-left", "0cm"); ("fo:margin-right", "0.369cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0.101cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "100%"); ("fo:orphans", "0");
            ("fo:widows", "0"); ("fo:text-indent", "0cm");
            ("style:auto-text-indent", "false")],
           []);
         Element
          ("style:text-properties", [("fo:background-color", "transparent")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P6"); ("style:family", "paragraph");
         ("style:parent-style-name", "Body")],
        [Element
          ("style:paragraph-properties",
           [("fo:line-height", "100%"); ("fo:orphans", "0");
            ("fo:widows", "0")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P7"); ("style:family", "paragraph");
         ("style:parent-style-name", "Body")],
        [Element
          ("style:paragraph-properties",
           [("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "100%"); ("fo:orphans", "0");
            ("fo:widows", "0")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P8"); ("style:family", "paragraph");
         ("style:parent-style-name", "Body")],
        [Element
          ("style:paragraph-properties",
           [("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("style:contextual-spacing", "false");
            ("fo:line-height", "0.035cm")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P9"); ("style:family", "paragraph");
         ("style:parent-style-name", "Header_20__26__20_Footer")],
        [Element
          ("style:paragraph-properties", [("style:writing-mode", "lr-tb")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P10"); ("style:family", "paragraph");
         ("style:parent-style-name", "Header_20__26__20_Footer")],
        [Element
          ("style:paragraph-properties",
           [("fo:break-before", "page"); ("style:writing-mode", "lr-tb")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P11"); ("style:family", "paragraph");
         ("style:parent-style-name", "Standard")],
        [Element
          ("style:paragraph-properties",
           [("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("style:contextual-spacing", "false"); ("fo:orphans", "0");
            ("fo:widows", "0")],
           [])]);
      Element
       ("style:style",
        [("style:name", "P12"); ("style:family", "paragraph")],
        [Element ("loext:graphic-properties", [("draw:fill", "none")], []);
         Element
          ("style:paragraph-properties", [("fo:text-align", "start")], []);
         Element ("style:text-properties", [("fo:font-size", "18pt")], [])]);
      Element
       ("style:style", [("style:name", "T1"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("style:rfc-language-tag", "es-ES-u-co-trad");
            ("fo:language", "es"); ("fo:country", "ES");
            ("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "T2"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("style:rfc-language-tag", "es-ES-u-co-trad");
            ("fo:language", "es"); ("fo:country", "ES")],
           [])]);
      Element
       ("style:style", [("style:name", "T3"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("fo:language", "en"); ("fo:country", "US");
            ("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "T4"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "T5"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("fo:language", "da"); ("fo:country", "DK");
            ("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "T6"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("fo:language", "de"); ("fo:country", "DE");
            ("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "T7"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("fo:language", "it"); ("fo:country", "IT");
            ("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "T8"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("fo:language", "nl"); ("fo:country", "NL");
            ("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "T9"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("fo:language", "pt"); ("fo:country", "PT");
            ("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "T10"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("fo:language", "fr"); ("fo:country", "FR");
            ("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "T11"); ("style:family", "text")],
        [Element
          ("style:text-properties",
           [("fo:language", "ru"); ("fo:country", "RU");
            ("fo:background-color", "transparent");
            ("loext:char-shading-value", "0")],
           [])]);
      Element
       ("style:style", [("style:name", "gr1"); ("style:family", "graphic")],
        [Element
          ("style:graphic-properties",
           [("draw:stroke", "solid"); ("svg:stroke-width", "0.009cm");
            ("svg:stroke-color", "#bfbfbf");
            ("draw:stroke-linejoin", "round");
            ("svg:stroke-linecap", "butt"); ("draw:fill", "none");
            ("draw:textarea-vertical-align", "top");
            ("draw:auto-grow-height", "false"); ("fo:min-height", "3.387cm");
            ("fo:min-width", "9.232cm"); ("fo:padding-top", "0.125cm");
            ("fo:padding-bottom", "0.125cm"); ("fo:padding-left", "0.25cm");
            ("fo:padding-right", "0.25cm"); ("fo:wrap-option", "wrap");
            ("fo:margin-left", "0cm"); ("fo:margin-right", "0cm");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("style:run-through", "foreground");
            ("style:wrap", "run-through");
            ("style:number-wrapped-paragraphs", "no-limit");
            ("style:vertical-pos", "from-top");
            ("style:vertical-rel", "page");
            ("style:horizontal-pos", "from-left");
            ("style:horizontal-rel", "page");
            ("draw:wrap-influence-on-position", "once-concurrent");
            ("loext:allow-overlap", "true");
            ("style:flow-with-text", "false")],
           [])]);
      Element
       ("style:page-layout", [("style:name", "pm1")],
        [Element
          ("style:page-layout-properties",
           [("fo:page-width", "21.001cm"); ("fo:page-height", "29.669cm");
            ("style:num-format", "1");
            ("style:print-orientation", "portrait");
            ("fo:margin-top", "0cm"); ("fo:margin-bottom", "0cm");
            ("fo:margin-left", "0.61cm"); ("fo:margin-right", "0.787cm");
            ("style:writing-mode", "lr-tb");
            ("style:layout-grid-color", "#c0c0c0");
            ("style:layout-grid-lines", "26854");
            ("style:layout-grid-base-height", "0.176cm");
            ("style:layout-grid-ruby-height", "0cm");
            ("style:layout-grid-mode", "none");
            ("style:layout-grid-ruby-below", "false");
            ("style:layout-grid-print", "false");
            ("style:layout-grid-display", "false");
            ("style:layout-grid-base-width", "0.423cm");
            ("style:layout-grid-snap-to", "true");
            ("style:footnote-max-height", "0cm");
            ("loext:margin-gutter", "0cm")],
           [Element
             ("style:footnote-sep",
              [("style:width", "0.018cm");
               ("style:distance-before-sep", "0.101cm");
               ("style:distance-after-sep", "0.101cm");
               ("style:line-style", "solid"); ("style:adjustment", "left");
               ("style:rel-width", "25%"); ("style:color", "#000000")],
              [])]);
         Element
          ("style:header-style", [],
           [Element
             ("style:header-footer-properties",
              [("fo:min-height", "1.513cm"); ("fo:margin-left", "0cm");
               ("fo:margin-right", "0cm"); ("fo:margin-bottom", "1.413cm");
               ("style:dynamic-spacing", "true")],
              [])]);
         Element
          ("style:footer-style", [],
           [Element
             ("style:header-footer-properties",
              [("fo:min-height", "1.302cm"); ("fo:margin-left", "0cm");
               ("fo:margin-right", "0cm"); ("fo:margin-top", "1.201cm");
               ("style:dynamic-spacing", "true")],
              [])])]);
      Element
       ("style:style",
        [("style:name", "dp1"); ("style:family", "drawing-page")],
        [Element
          ("style:drawing-page-properties",
           [("draw:background-size", "full")], [])])]);
   Element
    ("office:master-styles", [],
     [Element
       ("style:master-page",
        [("style:name", "Standard"); ("style:page-layout-name", "pm1");
         ("draw:style-name", "dp1")],
        [Element
          ("style:header", [],
           [Element ("text:p", [("text:style-name", "P1")], [])]);
         Element
          ("style:footer", [],
           [Element ("text:p", [("text:style-name", "P1")], [])])]);
      Element
       ("style:master-page",
        [("style:name", "Converted1"); ("style:page-layout-name", "pm1");
         ("draw:style-name", "dp1")],
        [Element
          ("style:header", [],
           [Element ("text:p", [("text:style-name", "P1")], [])]);
         Element
          ("style:footer", [],
           [Element ("text:p", [("text:style-name", "P1")], [])])]);
      Element
       ("style:master-page",
        [("style:name", "Converted2"); ("style:page-layout-name", "pm1");
         ("draw:style-name", "dp1")],
        [Element
          ("style:header", [],
           [Element ("text:p", [("text:style-name", "P2")], []);
            Element ("text:p", [("text:style-name", "P1")], [])]);
         Element
          ("style:footer", [],
           [Element ("text:p", [("text:style-name", "P1")], [])])])]);
   Element
    ("office:body", [],
     [Element
       ("office:text", [("text:use-soft-page-breaks", "true")],
        [Element
          ("text:sequence-decls", [],
           [Element
             ("text:sequence-decl",
              [("text:display-outline-level", "0");
               ("text:name", "Illustration")],
              []);
            Element
             ("text:sequence-decl",
              [("text:display-outline-level", "0"); ("text:name", "Table")],
              []);
            Element
             ("text:sequence-decl",
              [("text:display-outline-level", "0"); ("text:name", "Text")],
              []);
            Element
             ("text:sequence-decl",
              [("text:display-outline-level", "0"); ("text:name", "Drawing")],
              []);
            Element
             ("text:sequence-decl",
              [("text:display-outline-level", "0"); ("text:name", "Figure")],
              [])]);
         Element
          ("table:table",
           [("table:name", "Table1"); ("table:style-name", "Table1")],
           (Element ("table:table-column", [("table:style-name", "Table1.A")], []) ::
            Element ("table:table-column", [("table:style-name", "Table1.B")], []) ::
            Element ("table:table-column", [("table:style-name", "Table1.C")], []) ::
            List.flatten (List.init ((rows+13)/14) (fun page ->
            headitm data.(2+page*14) data.(3+page*14) ::
            List.init 6 (fun ix -> rowitm data.(4+ix*2+page*14) data.(5+ix*2+page*14))))));
         Element ("text:p", [("text:style-name", "P7")], []);
         Element
          ("text:p", [("text:style-name", "P8")],
           [Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "28");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "0.467cm");
               ("svg:y", "1.519cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 30"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "29");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "10.627cm");
               ("svg:y", "1.519cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 31"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "30");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "0.467cm");
               ("svg:y", "5.329cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 32"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "31");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "10.627cm");
               ("svg:y", "5.329cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 33"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "32");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "0.467cm");
               ("svg:y", "9.139cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 34"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "33");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "10.627cm");
               ("svg:y", "9.139cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 35"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "34");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "0.467cm");
               ("svg:y", "12.949cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 36"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "35");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "10.627cm");
               ("svg:y", "12.949cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 37"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "36");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "0.467cm");
               ("svg:y", "16.759cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 38"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "37");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "10.627cm");
               ("svg:y", "16.759cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 39"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "38");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "0.467cm");
               ("svg:y", "20.569cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 40"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "39");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "10.627cm");
               ("svg:y", "20.569cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 41"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "40");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "0.467cm");
               ("svg:y", "24.379cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 42"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])]);
            Element
             ("draw:custom-shape",
              [("text:anchor-type", "paragraph"); ("draw:z-index", "41");
               ("draw:name", "officeArt object"); ("draw:style-name", "gr1");
               ("draw:text-style-name", "P12"); ("svg:width", "9.907cm");
               ("svg:height", "3.811cm"); ("svg:x", "10.627cm");
               ("svg:y", "24.379cm")],
              [Element ("svg:desc", [], [PCData "AutoShape 43"]);
               Element ("text:p", [], []);
               Element
                ("draw:enhanced-geometry",
                 [("draw:mirror-horizontal", "false");
                  ("draw:mirror-vertical", "false");
                  ("draw:text-areas", "?f5 ?f5 ?f6 ?f7");
                  ("svg:viewBox", "0 0 0 0");
                  ("draw:type", "ooxml-roundRect");
                  ("draw:modifiers", "7875");
                  ("draw:enhanced-path",
                   "M 0 ?f2 L ?f3 0 L ?f11 ?f4 L ?f2 ?f10 Z N");
                  ("drawooo:enhanced-path",
                   "M 0 ?f2 G ?f2 ?f2 ?f12 ?f13 L ?f3 0 G ?f2 ?f2 ?f14 ?f15 L ?f11 ?f4 G ?f2 ?f2 ?f16 ?f17 L ?f2 ?f10 G ?f2 ?f2 ?f18 ?f19 Z N")],
                 [Element
                   ("draw:equation",
                    [("draw:name", "f0");
                     ("draw:formula", "if(0-$0 ,0,if(50000-$0 ,$0 ,50000))")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f1");
                     ("draw:formula", "min(logwidth,logheight)")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f2");
                     ("draw:formula", "?f1 *?f0 /100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f3");
                     ("draw:formula", "logwidth+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f4");
                     ("draw:formula", "logheight+0-?f2 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f5");
                     ("draw:formula", "?f2 *29289/100000")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f6");
                     ("draw:formula", "logwidth+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f7");
                     ("draw:formula", "logheight+0-?f5 ")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f8"); ("draw:formula", "logwidth/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f9"); ("draw:formula", "logheight/2")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f10"); ("draw:formula", "logheight")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f11"); ("draw:formula", "logwidth")], 
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f12");
                     ("draw:formula", "(10800000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f13");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f14");
                     ("draw:formula", "(16200000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f15");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f16"); ("draw:formula", "(0)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f17");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f18");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:equation",
                    [("draw:name", "f19");
                     ("draw:formula", "(5400000)/60000.0")],
                    []);
                  Element
                   ("draw:handle",
                    [("draw:handle-position", "?f2 0");
                     ("draw:handle-range-x-maximum", "50000");
                     ("draw:handle-range-x-minimum", "0")],
                    [])])])])])])])
