
# Table Action /  Type:[sap.m.tabe] ,mode : [MultiSelect]

### <Table id="midTable" mode="MultiSelect" width="100%" sticky="HeaderToolbar,ColumnHeaders">
                
                /**
                     * 신규행 추가
                     * @public
                     */
                    onMidCreate : function(){
                      console.group("onMidCreate");
                
                      //json version
                      var oModel = this.getOwnerComponent().getModel(),
                        oMaterial = oModel.getProperty("/Material"),
                        oTable = this._midTable,
                        oNewData = {
                          Language: "Korean",
                          Name: "철광석100"+Math.floor(Math.random() * 100),
                          LanguageKey: "KO"
                        };
                
                        oMaterial.push(oNewData);
                      oModel.refresh(true);
                
                      console.groupEnd();
                
                      //odata version
                      // var oBinding = this.byId("midTable").getBinding("items");
                      // var oContext = oBinding.create({
                      //         "Language": "Korean",
                      //         "Name": "철광석 2",
                      //         "LanguageKey": "KO" 
                      //     });
                
                      //     oContext.created().then(function () {
                      //       oBinding.refresh();                    
                      //     });
                
                      //     //focus 이동
                      //     oTable.getItems().some(function (oItems) {
                      //       if (oItems.getBindingContext() === oContext) {
                      //           oItems.focus();
                      //           oItems.setSelected(true);       
                      //           return true;
                      //       }
                      //     });          
                
                      console.groupEnd();
                    },
                    
                    
                /**
                     * 행 삭제
                     */
                    onMidDelete : function () {
                
                      console.group("onMidDelete");
                
                      //json version --------------------------------------------
                
                      var oModel = this.getOwnerComponent().getModel("odata"),
                          oMaterial = oModel.getProperty("/Material"),
                          oData = oModel.getData(),
                          oPath,
                          that = this;
                
                      var oSelected  = this._midTable.getSelectedContexts();
                      if (oSelected.length > 0) {
                
                          var msg = this.confirmDeleteRow;
                          this.getView().setBusy(true);
                
                          MessageBox.confirm(msg, {
                              title : this.confirmDeleteRowTitle,                        
                              initialFocus : sap.m.MessageBox.Action.CANCEL,
                              onClose : function(sButton) {
                                  if (sButton === MessageBox.Action.OK) {
                                      console.log("delete ok")
                
                                      //json
                                      for ( var i = oSelected.length - 1; i >= 0; i--) {
                                          
                                          var idx = parseInt(oSelected[0].sPath.substring(oSelected[0].sPath.lastIndexOf('/') + 1));
                                          oMaterial.splice(idx, 1);
                                      }
                
                                      that.getView().setBusy(false);
                                      oModel.setProperty("/Material", oMaterial);  
                                      this._midTable.removeSelections();
                                      oModel.refresh(true);  
                                      
                                      //MsgStrip 최상단에 있어 확인하기 어려움 메세지 박스 호출로 대체
                                      MessageBox.show("삭제가 성공 하였습니다.", {
                                          icon: MessageBox.Icon.ERROR,
                                          title: "삭제 성공",
                                          actions: [MessageBox.Action.OK],
                                          styleClass: "sapUiSizeCompact"
                                      });                                
                
                                  } else if (sButton === MessageBox.Action.CANCEL) {
                                     
                                      this.getView().setBusy(false);
                
                                      return;
                                  };
                              }
                          });                          
                
                      } else {
                           MessageBox.show("삭제가 실패 하였습니다.", {
                              icon: MessageBox.Icon.ERROR,
                              title: "삭제실패",
                              actions: [MessageBox.Action.OK],
                              styleClass: "sapUiSizeCompact"
                          });
                      }
                
                      oModel.setProperty("/Material", oMaterial);  
                      oTable.clearSelection();   
                      oModel.refresh(true);  
                      console.groupEnd();
                
                    },    
