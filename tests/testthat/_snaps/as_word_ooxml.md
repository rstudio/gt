# word ooxml can be generated from gt object

    Code
      writeLines(as.character(xml))
    Output
      <w:tbl xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml">
        <w:tblPr>
          <w:tblCellMar>
            <w:top w:w="0" w:type="dxa"/>
            <w:bottom w:w="0" w:type="dxa"/>
            <w:start w:w="60" w:type="dxa"/>
            <w:end w:w="60" w:type="dxa"/>
          </w:tblCellMar>
          <w:tblW w:type="pct" w:w="100"/>
          <w:tblLook w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noVBand="0" w:noHBand="0"/>
          <w:jc w:val="center"/>
        </w:tblPr>
        <w:tr>
          <w:trPr>
            <w:cantSplit/>
            <w:tblHeader/>
          </w:trPr>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="end"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">num</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">char</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="center"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">fctr</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="end"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">date</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="end"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">time</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="end"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">datetime</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="end"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">currency</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">row</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:sz="16" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">group</w:t>
              </w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <w:tr>
          <w:trPr>
            <w:cantSplit/>
          </w:trPr>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">0.1111</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">apricot</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">one</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">2015-01-15</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">13:35</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">2018-01-01 02:22</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">49.95</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">row_1</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcBorders>
                <w:top w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:bottom w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:start w:val="single" w:space="0" w:color="D3D3D3"/>
                <w:end w:val="single" w:space="0" w:color="D3D3D3"/>
              </w:tcBorders>
            </w:tcPr>
            <w:p>
              <w:pPr>
                <w:spacing w:before="0" w:after="60"/>
                <w:keepNext/>
                <w:jc w:val="start"/>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
                  <w:sz w:val="20"/>
                </w:rPr>
                <w:t xml:space="default">grp_a</w:t>
              </w:r>
            </w:p>
          </w:tc>
        </w:tr>
      </w:tbl>

---

    Code
      writeLines(as.character(xml))
    Output
      <w:p>
        <w:pPr>
          <w:spacing w:before="0" w:after="60"/>
          <w:keepNext/>
          <w:jc w:val="center"/>
          <w:pStyle w:val="caption"/>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
            <w:sz w:val="48"/>
          </w:rPr>
          <w:t xml:space="preserve">Table</w:t>
        </w:r>
        <w:r>
          <w:fldChar w:fldCharType="begin" w:dirty="true"/>
        </w:r>
        <w:r>
          <w:instrText xml:space="preserve" w:dirty="true"> SEQ Table \* ARABIC </w:instrText>
        </w:r>
        <w:r>
          <w:fldChar w:fldCharType="separate" w:dirty="true"/>
        </w:r>
        <w:r>
          <w:noProof/>
          <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
          <w:sz w:val="48"/>
          <w:t xml:space="default">1</w:t>
        </w:r>
        <w:r>
          <w:fldChar w:fldCharType="end" w:dirty="true"/>
        </w:r>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
            <w:sz w:val="48"/>
          </w:rPr>
          <w:t xml:space="preserve">: </w:t>
        </w:r>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
            <w:color w:val="333333"/>
            <w:sz w:val="24"/>
          </w:rPr>
          <w:t xml:space="default">TABLE TITLE</w:t>
        </w:r>
      </w:p>

---

    Code
      writeLines(as.character(xml))
    Output
      <w:p>
        <w:pPr>
          <w:spacing w:before="0" w:after="60"/>
          <w:keepNext/>
          <w:jc w:val="center"/>
          <w:pStyle w:val="caption"/>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
            <w:color w:val="333333"/>
            <w:sz w:val="16"/>
          </w:rPr>
          <w:t xml:space="default">table subtitle</w:t>
        </w:r>
      </w:p>

---

    Code
      writeLines(as.character(xml))
    Output
      <w:p>
        <w:pPr>
          <w:spacing w:before="0" w:after="60"/>
          <w:keepNext/>
          <w:jc w:val="center"/>
          <w:pStyle w:val="caption"/>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
            <w:color w:val="333333"/>
            <w:sz w:val="24"/>
          </w:rPr>
          <w:t xml:space="default">TABLE TITLE</w:t>
        </w:r>
      </w:p>

---

    Code
      writeLines(as.character(xml))
    Output
      <w:p>
        <w:pPr>
          <w:spacing w:before="0" w:after="60"/>
          <w:keepNext/>
          <w:jc w:val="center"/>
          <w:pStyle w:val="caption"/>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri"/>
            <w:color w:val="333333"/>
            <w:sz w:val="16"/>
          </w:rPr>
          <w:t xml:space="default">table subtitle</w:t>
        </w:r>
      </w:p>

