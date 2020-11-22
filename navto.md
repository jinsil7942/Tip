# 테이블 리스트 값에서 선택된 Row 나 Item값을 넘기는 예제 


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
