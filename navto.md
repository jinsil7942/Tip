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
    
### Detail.view.xml ====================================================== 

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
