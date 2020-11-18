## Type1


      <core:FragmentDefinition
          xmlns="sap.m"
          xmlns:core="sap.ui.core"
          xmlns:l="sap.ui.layout"
          xmlns:f="sap.ui.layout.form"
          xmlns:table="sap.ui.table"
          width="50%"
          height="30%"
          class="sapUiSizeCompact">

          <Dialog title="자재명 검색">

              <content>
                  <f:SimpleForm
                      editable="false"
                      layout="ResponsiveGridLayout"
                      labelSpanL="1"
                      labelSpanM="1"
                      emptySpanL="9"
                      emptySpanM="9"
                      columnsL="3"
                      columnsM="3"
                      singleContainerFullSize="false"
                      adjustLabelSpan="false"
                      class="sapUiSizeCompact">
                      <f:content>
                          <Label text="자재명"/>
                          <Input editable="true" id="card_pop_code"/>
                          <Button icon="sap-icon://search" text="Search" press=".onMaterialCodeSearch"/>
                      </f:content>
                  </f:SimpleForm>
              </content>
              <FlexBox height="70px" alignItems="Start" justifyContent="End">
                  <Button text="Draft" press=".onMaterialCodeDraft" class="sapUiTinyMarginEnd"/>
                  <Button text="Cancel" press=".onMaterialCodeCancel" class="sapUiTinyMarginEnd"/>
              </FlexBox>

          </Dialog>

      </core:FragmentDefinition>
      

## Type2


          <core:FragmentDefinition
            xmlns			= "sap.m"
            xmlns:core		= "sap.ui.core"
            xmlns:l			= "sap.ui.layout"
            xmlns:f			= "sap.ui.layout.form"
            xmlns:table		= "sap.ui.table"
            width 			= "30%"
            height			= "30%"
            class			= "sapUiSizeCompact">

            <Dialog title="자재명 검색">

              <content>
              <f:SimpleForm
                      editable				= "false"
                      layout					= "ResponsiveGridLayout"
                      labelSpanL				= "1"
                      labelSpanM				= "1"
                      emptySpanL				= "6"
                      emptySpanM				= "6"
                      columnsL				= "1"
                      columnsM				= "1"
                      singleContainerFullSize = "false"
                      class					= "sapUiSizeCompact">

                      <f:content>
                        <Label text="자재명" class="sapUiTinyMarginTop"/>
                        <Input editable="true" id="input"/>
                        <Button width="9em" icon="sap-icon://search" text="Search"  press="onsearch" class="sapUiTinyMarginBegin"/>							
                      </f:content>
                    </f:SimpleForm>

                    <table:Table 
                      id					= "materialTable" 
                      rows				= "{path:'/'}" 
                      class 				= "sapUiLargeMarginBegin sapUiLargeMarginEnd sapUiLargeMarginButton" 
                      selectionMode		= "MultiSelect"  >
                      <table:columns>
                        <table:Column width="9em">
                          <Label text="Language" />
                          <table:template>
                            <Text text="{Code}" />
                          </table:template>
                        </table:Column>

                        <table:Column>
                          <Label text="자재명" />
                          <table:template>
                            <Text  text="{Text}" />
                          </table:template>
                        </table:Column>
                      </table:columns>
                    </table:Table>	
                  <FlexBox height="70px" alignItems="Start" class="sapUiSmallMarginTop" justifyContent="End">
                      <Button text="Add" press=".onMaterialNameDelete" class="sapUiTinyMarginEnd "/>
                      <Button text="Delete" press=".onMaterialNameDelete" class="sapUiTinyMarginEnd"/>
                      <Button text="Draft" press=".onMaterialNameDraft" class="sapUiTinyMarginEnd"/>
                      <Button text="Cancel" press=".onMaterialNameCancel" class="sapUiLargeMarginEnd"/>
                    </FlexBox>
                  </content>
            </Dialog>
          </core:FragmentDefinition>
