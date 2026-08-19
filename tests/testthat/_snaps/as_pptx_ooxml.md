# parse_to_ooxml(pptx) creates the correct nodes

    Code
      writeLines(as.character(xml))
    Output
      <a:p>
        <a:pPr>
          <a:spcBef>
            <a:spcPts val="0"/>
          </a:spcBef>
          <a:spcAft>
            <a:spcPts val="300"/>
          </a:spcAft>
        </a:pPr>
        <a:r>
          <a:rPr lang="en-US"/>
          <a:t>hello</a:t>
        </a:r>
      </a:p>

# pptx ooxml can be generated from gt object

    Code
      writeLines(as.character(xml))
    Output
      <a:tbl>
        <a:tblPr firstRow="0" lastRow="0" firstCol="0" lastCol="0" bandCol="0" bandRow="0">
          <a:tableW type="auto" w="9144000"/>
          <a:tblLook firstRow="0" lastRow="0" firstCol="0" lastCol="0" noHBand="1" noVBand="1" val="04A0"/>
          <a:tableStyleId>{5C22544A-7EE6-4342-B048-85BDC9FD1C3A}</a:tableStyleId>
        </a:tblPr>
        <a:tblGrid>
          <a:gridCol w="1016000"/>
          <a:gridCol w="1016000"/>
          <a:gridCol w="1016000"/>
          <a:gridCol w="1016000"/>
          <a:gridCol w="1016000"/>
          <a:gridCol w="1016000"/>
          <a:gridCol w="1016000"/>
          <a:gridCol w="1016000"/>
          <a:gridCol w="1016000"/>
        </a:tblGrid>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">num</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">char</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">fctr</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">date</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">time</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">datetime</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">currency</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">row</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">group</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">0.1111</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">apricot</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">one</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2015-01-15</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">13:35</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2018-01-01 02:22</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">49.95</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">row_1</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">grp_a</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
      </a:tbl>

---

    Code
      writeLines(as.character(xml))
    Output
      <a:p>
        <a:pPr algn="ctr">
          <a:defRPr>
            <a:solidFill>
              <a:srgbClr val="333333"/>
            </a:solidFill>
          </a:defRPr>
          <a:spcBef>
            <a:spcPts val="0"/>
          </a:spcBef>
          <a:spcAft>
            <a:spcPts val="300"/>
          </a:spcAft>
        </a:pPr>
        <a:r>
          <a:rPr lang="en-US" sz="1200">
            <a:latin typeface="Calibri"/>
          </a:rPr>
          <a:t xml:space="default">TABLE TITLE</a:t>
        </a:r>
      </a:p>

---

    Code
      writeLines(as.character(xml))
    Output
      <a:p>
        <a:pPr algn="ctr">
          <a:defRPr>
            <a:solidFill>
              <a:srgbClr val="333333"/>
            </a:solidFill>
          </a:defRPr>
          <a:spcBef>
            <a:spcPts val="0"/>
          </a:spcBef>
          <a:spcAft>
            <a:spcPts val="300"/>
          </a:spcAft>
        </a:pPr>
        <a:r>
          <a:rPr lang="en-US" sz="800">
            <a:latin typeface="Calibri"/>
          </a:rPr>
          <a:t xml:space="default">table subtitle</a:t>
        </a:r>
      </a:p>

# pptx_ooxml can be generated with defined cell borders

    Code
      writeLines(as.character(xml))
    Output
      <a:tbl>
        <a:tblPr firstRow="0" lastRow="0" firstCol="0" lastCol="0" bandCol="0" bandRow="0">
          <a:tableW type="auto" w="9144000"/>
          <a:tblLook firstRow="0" lastRow="0" firstCol="0" lastCol="0" noHBand="1" noVBand="1" val="04A0"/>
          <a:tableStyleId>{5C22544A-7EE6-4342-B048-85BDC9FD1C3A}</a:tableStyleId>
        </a:tblPr>
        <a:tblGrid>
          <a:gridCol w="2286000"/>
          <a:gridCol w="2286000"/>
          <a:gridCol w="2286000"/>
          <a:gridCol w="2286000"/>
        </a:tblGrid>
        <a:tr h="254000">
          <a:tc gridSpan="2">
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default"/>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default"/>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">year</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="0000FF"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="0000FF"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="0000FF"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="0000FF"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">hp</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="0000FF"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Bentley</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFC0CB"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Continental GT</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">500</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc rowSpan="4">
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Aston Martin</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFC0CB"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFC0CB"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFC0CB"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFC0CB"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
              <a:rowSpan val="4"/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">DB11</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFC0CB"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2017</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">608</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc vMerge="1">
            <a:txBody>
              <a:bodyPr/>
              <a:lstStyle/>
              <a:p>
                <a:endParaRPr/>
              </a:p>
            </a:txBody>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Rapide S</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFC0CB"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">552</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc vMerge="1">
            <a:txBody>
              <a:bodyPr/>
              <a:lstStyle/>
              <a:p>
                <a:endParaRPr/>
              </a:p>
            </a:txBody>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Vanquish</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFC0CB"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">568</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc vMerge="1">
            <a:txBody>
              <a:bodyPr/>
              <a:lstStyle/>
              <a:p>
                <a:endParaRPr/>
              </a:p>
            </a:txBody>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Vantage</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFC0CB"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="00FF00"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">430</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Lotus</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Evora</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2017</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">400</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Jaguar</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">F-Type</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">340</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">McLaren</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">570</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">570</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc rowSpan="2">
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Rolls-Royce</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
              <a:rowSpan val="2"/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Dawn</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">563</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc vMerge="1">
            <a:txBody>
              <a:bodyPr/>
              <a:lstStyle/>
              <a:p>
                <a:endParaRPr/>
              </a:p>
            </a:txBody>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Wraith</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">624</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
      </a:tbl>

---

    Code
      writeLines(as.character(xml))
    Output
      <a:tbl>
        <a:tblPr firstRow="0" lastRow="0" firstCol="0" lastCol="0" bandCol="0" bandRow="0">
          <a:tableW type="auto" w="9144000"/>
          <a:tblLook firstRow="0" lastRow="0" firstCol="0" lastCol="0" noHBand="1" noVBand="1" val="04A0"/>
          <a:tableStyleId>{5C22544A-7EE6-4342-B048-85BDC9FD1C3A}</a:tableStyleId>
        </a:tblPr>
        <a:tblGrid>
          <a:gridCol w="2286000"/>
          <a:gridCol w="2286000"/>
          <a:gridCol w="2286000"/>
          <a:gridCol w="2286000"/>
        </a:tblGrid>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default"/>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc gridSpan="3">
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Test span 2</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default"/>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default"/>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc gridSpan="3">
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Test span 1</a:t>
                </a:r>
                <a:r>
                  <a:rPr i="1" baseline="30000" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">1</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default"/>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default"/>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="ctr">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default"/>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FFA500"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">mfr</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">model</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">year</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="FF0000"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">hp</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12700" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="9525" cap="flat" cmpd="sng" algn="ctr">
                <a:noFill/>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="19050" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Bentley</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Continental GT</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">500</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Aston Martin</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">DB11</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2017</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">608</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Aston Martin</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Rapide S</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">552</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Aston Martin</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Vanquish</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">568</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Aston Martin</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Vantage</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">430</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Lotus</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Evora</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2017</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">400</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Jaguar</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">F-Type</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">340</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">McLaren</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">570</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">570</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Rolls-Royce</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Dawn</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">563</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Rolls-Royce</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="l">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Wraith</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">2016</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc>
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr algn="r">
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">624</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:lnL w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnL>
              <a:lnR w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnR>
              <a:lnT w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnT>
              <a:lnB w="12697" cap="flat" cmpd="sng" algn="ctr">
                <a:solidFill>
                  <a:srgbClr val="D3D3D3"/>
                </a:solidFill>
                <a:prstDash val="solid"/>
                <a:round/>
                <a:headEnd type="none" w="med" len="med"/>
                <a:tailEnd type="none" w="med" len="med"/>
              </a:lnB>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
        <a:tr h="254000">
          <a:tc gridSpan="4">
            <a:txBody>
              <a:bodyPr vertOverflow="clip" horzOverflow="clip" wrap="square" rtlCol="0" anchor="ctr"/>
              <a:lstStyle/>
              <a:p>
                <a:pPr>
                  <a:spcBef>
                    <a:spcPts val="0"/>
                  </a:spcBef>
                  <a:spcAft>
                    <a:spcPts val="300"/>
                  </a:spcAft>
                </a:pPr>
                <a:r>
                  <a:rPr i="1" baseline="30000"/>
                  <a:t xml:space="default">1</a:t>
                </a:r>
                <a:r>
                  <a:rPr lang="en-US" sz="1000">
                    <a:latin typeface="Calibri"/>
                  </a:rPr>
                  <a:t xml:space="default">Test Footnote in Span</a:t>
                </a:r>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc hMerge="1">
            <a:txBody>
              <a:bodyPr/>
              <a:lstStyle/>
              <a:p>
                <a:endParaRPr/>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc hMerge="1">
            <a:txBody>
              <a:bodyPr/>
              <a:lstStyle/>
              <a:p>
                <a:endParaRPr/>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
          <a:tc hMerge="1">
            <a:txBody>
              <a:bodyPr/>
              <a:lstStyle/>
              <a:p>
                <a:endParaRPr/>
              </a:p>
            </a:txBody>
            <a:tcPr>
              <a:noFill/>
            </a:tcPr>
          </a:tc>
        </a:tr>
      </a:tbl>

