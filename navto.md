# 테이블 리스트 값에서 선택된 Row 나 Item값을 넘기는 예제 


## 예제 0)

### xml
                                    <items>
                                        <ColumnListItem type="Navigation" hAlign="Middle" press=".onMainTableItemPress">
                                             <core:CustomData key="tenant_id" value="{tenant_id}"/>
                                             <core:CustomData key="company_code" value="{company_code}"/>
                                             <core:CustomData key="org_code" value="{org_code}"/>
                                             <core:CustomData key="org_type_code" value="{org_type_code}"/>
                                             <core:CustomData key="category_code" value="{category_code}"/>

                                             <Text text="{mi_material_code}"></Text>
                                             <Text text="{mi_material_code_text}"></Text>
                                             <Text text="{category}"></Text>
                                             <Text text="{= ${use_flag}===true?'예':'아니오'}"></Text>                               
                                        </ColumnListItem>
                                    </items>
				    
### controller
		onMainTableItemPress: function(oEvent) {
			var oNextUIState = this.getOwnerComponent().getHelper().getNextUIState(1),
				sPath = oEvent.getSource().getBindingContext().getPath(),
				oRecord = this.getModel().getProperty(sPath);
		
				/*CustomData 를 사용하지 않고 sPath를 사용할때. */
				// var aParameters = sPath.substring( sPath.indexOf('(')+1, sPath.length );		
				// aParameters = aParameters.split(",");
		
				// var size = aParameters.length;
				// var key, value;
				// for(var i=0 ; i < size ; i++) {
				// 	key = aParameters[i].split("=")[0];
				// 	value = aParameters[i].split("=")[1];			 
				// 	aParameters[key] = value;
				// }

				// oRecord: Object
				// category: "Non-Ferrous Metal"
				// category_text: "비철금속"
				// company_code: "*"
				// create_user_id: "Admin"
				// local_create_dtm: Wed Nov 18 2020 01:08:00 GMT+0900 (대한민국 표준시) {}
				// local_update_dtm: Wed Nov 18 2020 01:08:00 GMT+0900 (대한민국 표준시) {}
				// mi_material_code: "LED-001-01"
				// mi_material_code_text: "니켈"
				// org_code: "BIZ00100"
				// org_type_code: "BU"
				// system_create_dtm: Wed Nov 18 2020 01:08:00 GMT+0900 (대한민국 표준시) {}
				// system_update_dtm: Wed Nov 18 2020 01:08:00 GMT+0900 (대한민국 표준시) {}
				// tenant_id: "L2100"
				// update_user_id: "Admin"
				// use_flag: true
			this.getRouter().navTo("midPage", {
				layout: oNextUIState.layout, 
				tenant_id: aParameters["tenant_id"],
                company_code: aParameters["company_code"],
				org_type_code: aParameters["org_type_code"],
				org_code :aParameters["org_code"],
				category_code : oRecord.category_code,
				category : oRecord.category,
				org_code : aParameters["org_code"],
				mi_material_code: oRecord.mi_material_code,
				use_flag: oRecord.use_flag
				//{layout}/{tenant_id}/{company_code}/{org_type_code}/{org_code}/{mi_material_code}/{use_flag}",
            });
	    

## 예제 1)

### Main.view.xml ======================================================
		onSelect: function (oEvent) {
			var oContext = oEvent.getBindingContext("rows"),
				sPath = oContext.getPath();

			var aParameters=sPath.split("/");
			UIComponent.getRouterFor(this).navTo("Detail", {
				movieId: aParameters[2],
				appointmentId: aParameters[4]
			});
		}
    
       
    
### Detail.view.xml ======================================================  
		onInit: function() {
			UIComponent.getRouterFor(this).getRoute("Detail").attachPatternMatched(this._onDetailMatched, this);
		},

		_onDetailMatched : function (oEvent) {
			var oView = this.getView(),
				main_id = oEvent.getParameter("arguments")["main_id"],
				sub_id = oEvent.getParameter("arguments")["sub_id"];

			oView.bindElement({
				path: "/document/" + main_id + "/doc/" + sub_id,
				model: "main",
				events: {
					change : this._onBindingChange.bind(this)
				}
			});
		},    
    
## 예제 2)

### Main.view.xml ======================================================

  	_showDetail : function (oItem) {
			var bReplace = !Device.system.phone;
			// set the layout property of FCL control to show two columns
			this.getModel("appView").setProperty("/layout", "TwoColumnsMidExpanded");
			this.getRouter().navTo("object", {
				objectId : oItem.getBindingContext().getProperty("SalesOrderID")
			}, bReplace);
			
		},
		
## Detail.controller.js  ====================================================== 

### path 와 getProperty 혼용

		onMainTableItemPress: function(oEvent) {
			var oNextUIState = this.getOwnerComponent().getHelper().getNextUIState(1),
				sPath = oEvent.getSource().getBindingContext().getPath(),
				oRecord = this.getModel().getProperty(sPath);
		
				var aParameters = sPath.substring( sPath.indexOf('(')+1, sPath.length );		
				aParameters = aParameters.split(",");
		
				var size = aParameters.length;
				var key, value;
				for(var i=0 ; i < size ; i++) {
					key = aParameters[i].split("=")[0];
					value = aParameters[i].split("=")[1];			 
					aParameters[key] = value;
				}
				

			this.getRouter().navTo("midPage", {
				layout: oNextUIState.layout, 
				tenant_id: aParameters["tenant_id"],
                company_code: aParameters["company_code"],
				org_type_code: aParameters["org_type_code"],
				org_code :aParameters["org_code"],
				mi_material_code: oRecord.mi_material_code,
				use_flag: oRecord.use_flag
				//{layout}/{tenant_id}/{company_code}/{org_type_code}/{org_code}/{mi_material_code}/{use_flag}",
            });
		);  
### Detail.controller.js  ====================================================== 

		onInit: function() {
			UIComponent.getRouterFor(this).getRoute("Detail").attachPatternMatched(this._onDetailMatched, this);
		},
    
		_onObjectMatched : function (oEvent) {
			var sObjectId =  oEvent.getParameter("arguments").objectId;

			if (!sObjectId) {
				return;
			}
			if (oEvent.getParameter("name") === "object") {
				this.getModel("appView").setProperty("/layout", "TwoColumnsMidExpanded");
			}

			this.getModel().metadataLoaded().then( function() {
				var sObjectPath = this.getModel().createKey("SalesOrderSet", {
					SalesOrderID : sObjectId
				});
				this._bindView("/" + sObjectPath);
			}.bind(this));
		},
		
		
			var oNextUIState = this.getOwnerComponent().getHelper().getNextUIState(1),
			sPath = oEvent.getSource().getBindingContext().getPath(),
			oRecord = this.getModel().getProperty(sPath);


### Detail.controller.js 

			this.getRouter().navTo("midPage", {
			layout: oNextUIState.layout, 
			tenant_id: oRecord.tenant_id,
			company_code: oRecord.company_code,
			org_type_code: oRecord.org_type_code,
			org_code : oRecord.org_code,
			mi_material_code: oRecord.mi_material_code,
			use_flag: oRecord.use_flag
			//{layout}/{tenant_id}/{company_code}/{org_type_code}/{org_code}/{mi_material_code}/{use_flag}",
			});
