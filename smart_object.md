# SmartVariantManagement 
                <!-- VariantManagement -->
                <smartVariantManagement:SmartVariantManagement        
				             id="pageVariantId" //아이디를 맞추어 주어야 한다. 
				             persistencyKey="PageVariantPKey" />                

                <!-- FilterBar -->
                <smartFilterBar:SmartFilterBar id="smartFilterBar" 
                    entitySet="MIMaterialCodeList" 
                    smartVariant="pageVariantId" //아이디를 맞추어 주어야 한다. 

                 <!-- Smart Table -->
                <smartTable:SmartTable
                    height="100%"
                    smartVariant="pageVariantId" //아이디를 맞추어 주어야 한다. 
                    
                    
# Sapui5 Samrt Filter
                  <smartFilterBar:SmartFilterBar 
                  id="smartFilterBar" //스마트 테이블 smartFilterId 속성과 동일하게 맞추어준다. 
                  entitySet="MIMaterialCodeList" //테이블과 동일한 entitySet  주어야 한다.`
                  persistencyKey="SmartFilter_Explored"  //persistency 활성화 여부
                  enableBasicSearch="false" //기본 Search 표현여부
                  >
                      <smartFilterBar:controlConfiguration>
                          <smartFilterBar:ControlConfiguration 
                          key="mi_material_code_text"  //`필터로 사용할 컬럼`
                          visibleInAdvancedArea="true" //true로 설정되어야 테이블 필터가 스마트 필터로 연동됨 
                          >
                          <!-- 기본값 설정 -- >
                              <smartFilterBar:defaultFilterValues>
                                  <smartFilterBar:SelectOption low="0001">   
                                  </smartFilterBar:SelectOption>
                              </smartFilterBar:defaultFilterValues>     
                              </smartFilterBar:ControlConfiguration>
                          <smartFilterBar:ControlConfiguration key="category" visibleInAdvancedArea="true"/>
                          <smartFilterBar:ControlConfiguration key="category_text" visibleInAdvancedArea="true"/>
                          <smartFilterBar:ControlConfiguration key="use_flag" visibleInAdvancedArea="true"/>              
                      </smartFilterBar:controlConfiguration>
                      <smartFilterBar:layoutData>
                          <FlexItemData shrinkFactor="0"/>
                      </smartFilterBar:layoutData>
                  </smartFilterBar:SmartFilterBar>
                  
# Sapui5 Samrt customControl

### 필터 기본값 등록 : customData:hasValue="true"
                         
			<ComboBox id="category_code" customData:hasValue="true" items="{/MICategoryView}">
			<core:Item key="{category_code}" text="{category_code_text}"/>
                                 
			    
                          <!-- Smart Filter -->
                                      	<smartFilterBar:SmartFilterBar id="smartFilterBar" smartVariant="__SVM01" useToolbar="true" 
                                          entitySet="MonitoringMasterView_02" persistencyKey="UniqueAndStablePersistencyKey" enableBasicSearch="false">
                                            <smartFilterBar:controlConfiguration>
                                                <!-- 회사 -->
                                                <smartFilterBar:ControlConfiguration 
                                                key="tenant_id" //컬럼
                                                index="1"  //검색순서
                                                label="회사" //라벨
                                                groupId="_BASIC" //필터 설정시 기본값
                                                visibleInAdvancedArea="true" //페이지 표시여부
                                                >
                                                    <smartFilterBar:customControl>
                                                          <ComboBox 
                                                          id="company_combo" //오브젝트 아이디
                                                          items="{/OrgTenantView}"  //items EntitySet
                                                          change="onChangeCombo"> //변경 이벤트
                                                            <core:Item key="{tenant_id}" text="{tenant_name}"/>
                                                        </ComboBox>
                                                    </smartFilterBar:customControl>
                                                </smartFilterBar:ControlConfiguration>

                                                <!-- 법인 -->
                                             <smartFilterBar:ControlConfiguration key="company_code" index="2" label="법인" groupId="_BASIC" visibleInAdvancedArea="true">
                                                    <smartFilterBar:customControl>
                                                    <ComboBox id="corp_combo" items="{/OrgCompanyView}">
                                                        <core:Item key="{company_code}" text="{company_name}"/>
                                                    </ComboBox>
                                                    </smartFilterBar:customControl>
                                                </smartFilterBar:ControlConfiguration> 

                                                 <!-- 사업본부 -->
                                                <smartFilterBar:ControlConfiguration key="bizunit_code" index="3" label="사업본부" groupId="_BASIC" visibleInAdvancedArea="true">
                                                    <smartFilterBar:customControl>
                                                    	<MultiComboBox id="business_combo" items="{/OrgUnitView}">
                                                            <core:Item key="{bizunit_code}" text="{bizunit_name}"/>
                                                        </MultiComboBox>
                                                    </smartFilterBar:customControl>
                                                </smartFilterBar:ControlConfiguration> 

                                     
                                            </smartFilterBar:controlConfiguration>
                                            <smartFilterBar:layoutData>
                                                <FlexItemData shrinkFactor="0"/>
                                            </smartFilterBar:layoutData>
                                        </smartFilterBar:SmartFilterBar> 
                                        





# Sapui5 Samrt Table               

              <smartTable:SmartTable
                    height="100%"
                    id="LineItemsSmartTable"
                    entitySet="MIMaterialCodeList"  //entitySet
                    initiallyVisibleFields="mi_material_code_text,category,category_text,use_flag"  //커스텀 컬럼을 설정하지 않을시 기본적으로 처음에 출력할 컬럼
                    smartFilterId="smartFilterBar" //smartFilter와의 연동을 위해 설정
                    tableType="ResponsiveTable" //테이블 타입
                    useExportToExcel="true" //엑셀출력
                    beforeExport=".onBeforeExport"
                    useVariantManagement="true"
                    useTablePersonalisation="true"
		    beforeRebindTable="onBeforeRebindTable"  //custom filter 검색을 실행하는데 필수
                    showTablePersonalisation="false"
		    editTogglable="false" //true로 설정하면 컬럼을 수정하는 화면으로 전환됨
                    header="List"
		    enableAutoBinding="true" // Auto 바인딩
                    showRowCount="true"
                    persistencyKey="SmartTableAnalytical_Explored"
                    enableAutoBinding="true"
                    class="sapUiResponsiveContentPadding"
                    demandPopin="true"
                    showFullScreenButton="false">
                    <smartTable:customToolbar>
                        <OverflowToolbar design="Transparent">
                            <ToolbarSpacer/>
                            <Button text="Create" type="Transparent" press=".onCreate"/>
                            <Button text="Delete" type="Transparent" press=".onDelete"/>
                            <Button text="Copy" type="Transparent" press=".onCopy"/>
                            <OverflowToolbarButton
                                icon="sap-icon://sort"
                                tooltip="Sort"
                                text="Sort"
                                press=".onSort"/>
                            <OverflowToolbarButton
                                icon="sap-icon://filter"
                                tooltip="Filter"
                                text="Filter"
                                press=".onFilter"/>
                            <OverflowToolbarButton
                                icon="sap-icon://group-2"
                                tooltip="Group"
                                text="Group"
                                press=".onGroup"/>
                            <OverflowToolbarButton
                                icon="sap-icon://action-settings"
                                tooltip="Column Settings"
                                text="Column Settings"
                                press=".onColumns"/>
                        </OverflowToolbar>
                    </smartTable:customToolbar>
                </smartTable:SmartTable>
		
		

## beforeRebindTable[스마트필터 커스텀과 연동]
                
		onBeforeRebindTable: function (oEvent) {
			console.group("onBeforeRebindTable");
			var mBindingParams = oEvent.getParameter("bindingParams");
			var oSmtFilter = this.getView().byId("smartFilterBar");             //smart filter
			
			//combobox value
			var oMi_material_code = oSmtFilter.getControlByKey("mi_material_code").getValue();     
			var oMi_material_code_text = oSmtFilter.getControlByKey("mi_material_code_text").getValue();               
			var oCategory_code = oSmtFilter.getControlByKey("category_code").getValue();   
			var oCode = oSmtFilter.getControlByKey("code").getValue();   

			if (oMi_material_code.length > 0) {
				var oMi_material_codeFilter = new Filter("mi_material_code", FilterOperator.EQ, oMi_material_code_text);
				mBindingParams.filters.push(oMi_material_codeFilter);
			}

			if (oMi_material_code_text.length > 0) {
				var oMi_material_code_textFilter = new Filter("mi_material_code_text", FilterOperator.EQ, oMi_material_code_text);
				mBindingParams.filters.push(oMi_material_code_textFilter);
			}

			if (oCategory_code.length > 0) {
				var oCategory_codeFilter = new Filter("category_code", FilterOperator.EQ, oCategory_code);
				mBindingParams.filters.push(oCategory_codeFilter);
			}
			
			if (oCode.length > 0) {
				var oCodeFilter = new Filter("code", FilterOperator.EQ, oCode);
				mBindingParams.filters.push(oCodeFilter);
			}  
			console.groupEnd();              
		},


		
