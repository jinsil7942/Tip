## ComboBox 

### xml
            <ComboBox id="comboBoxType" items="{view>/ItemType}" enabled="{=${ui>/bEditMode}}">
            <core:Item key="{view>key}" text="{view>text}"/>
            <layoutData>
            <l:GridData span="XL2 L4 M2 S12"/>
            </layoutData>
            </ComboBox>
            
### controller            
            oView.byId("comboBoxType").setSelectedKey(oModel.getProperty("/comboBoxType"));
            oView.byId("comboboxScenario").setSelectedKey(oModel.getProperty("/comboboxScenario"));



## RadioButtonGroup
            <RadioButtonGroup
            id="radioActive"
            columns="2"
            width="100%"
            enabled="{=${ui>/bEditMode}}">
            <RadioButton text="Active"/>
            <RadioButton text="In Active"/>
            </RadioButtonGroup>
                                                        
            //Active 0 Active, 1 In Active
            var oRadioSelectIndex = oModel.getProperty("/radioActive");
            oRadioSelectIndex = parseInt(oRadioSelectIndex);
            oView.byId("radioActive").setSelectedIndex(oRadioSelectIndex);

      oView.byId("comboBoxRawMaterials").setSelectedKey(oModel.getProperty("/comboBoxRawMaterials"));


      oView.byId("comboboxOffice").setSelectedKey(oModel.getProperty("/comboboxOffice"));

 
      oView.byId("conboBoxNatioinStatus").setSelectedKey(oModel.getProperty("/conboBoxNatioinStatus"));

 
      ///richTextEditor : setValue getValue setEditable setEditorType setRequired setTextDirection setValue
      oView.byId("reMonitoringPurpose").setHeight("150px");

      //remo.setTextDirection("setTextDirection");//oModel.getProperty("/reMonitoringPurpose")
      oView.byId("reMonitoringPurpose").setValue(this._richTextEditor());
    
      oView.byId("reMonitoringPurposeDetail").setValue(oModel.getProperty("/reMonitoringPurposeDetail"));
 
      //checkbox getSelected() getText() setSelected() editable

      oView.byId("checkBoxOMType1").setSelected(oModel.getProperty("/checkBoxOMType1"));
      oView.byId("checkBoxOMType2").setSelected(oModel.getProperty("/checkBoxOMType2"));
      oView.byId("checkBoxOMType3").setSelected(oModel.getProperty("/checkBoxOMType3"));


      oView.byId("reSourceSystem").setValue(oModel.getProperty("/reSourceSystem"));

      oView.byId("reSourceSystemDetail").setValue(oModel.getProperty("/reSourceSystemDetail"));
