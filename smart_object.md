# Sapui5 Samrt Filter
                  <smartFilterBar:SmartFilterBar id="smartFilterBar" 
                  entitySet="MIMaterialCodeList" //테이블과 동일한 entitySet  주어야 한다.`
                  persistencyKey="SmartFilter_Explored"  //persistency 활성화 여부
                  enableBasicSearch="false" //기본 Search 표현여부
                  >
                      <smartFilterBar:controlConfiguration>
                          <smartFilterBar:ControlConfiguration 
                          key="mi_material_code_text"  //필터로 사용하 컬럼
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
                  
                  
