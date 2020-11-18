## Enter Key 

  Xml
  
      Input id="inputMaterialCode" 
        
      onInit : function(){

        //this.byId("LineItemsSmartTable")

        this.byId("inputMaterialCode").attachBrowserEvent('keypress', function(e){
          if(e.which == 13){
            this.onMaterialCodeOpen();
          }
        });
      },
