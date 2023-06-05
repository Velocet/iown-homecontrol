package mx.controls
{
   import flash.display.InteractiveObject;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import flash.xml.XMLNode;
   import mx.collections.ArrayCollection;
   import mx.collections.ICollectionView;
   import mx.collections.XMLListCollection;
   import mx.collections.errors.ItemPendingError;
   import mx.controls.menuClasses.IMenuDataDescriptor;
   import mx.controls.treeClasses.DefaultDataDescriptor;
   import mx.core.Application;
   import mx.core.EventPriority;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.FlexNativeMenuEvent;
   import mx.managers.ILayoutManagerClient;
   import mx.managers.ISystemManager;
   
   public class FlexNativeMenu extends EventDispatcher implements ILayoutManagerClient, IFlexContextMenu
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var MNEMONIC_INDEX_CHARACTER:String = "_";
       
      
      private var _labelField:String = "label";
      
      private var _initialized:Boolean = false;
      
      private var _keyEquivalentFunction:Function;
      
      private var keyEquivalentFieldChanged:Boolean = false;
      
      private var _mnemonicIndexFunction:Function;
      
      private var showRootChanged:Boolean = false;
      
      private var _mnemonicIndexField:String = "mnemonicIndex";
      
      private var invalidatePropertiesFlag:Boolean = false;
      
      private var _hasRoot:Boolean = false;
      
      private var labelFieldChanged:Boolean = false;
      
      private var _keyEquivalentModifiersFunction:Function;
      
      private var dataProviderChanged:Boolean = false;
      
      private var _nestLevel:int = 1;
      
      private var _processedDescriptors:Boolean = false;
      
      private var _updateCompletePendingFlag:Boolean = false;
      
      private var mnemonicIndexFieldChanged:Boolean = false;
      
      private var _nativeMenu:NativeMenu;
      
      private var dataDescriptorChanged:Boolean = false;
      
      private var _dataDescriptor:IMenuDataDescriptor;
      
      private var _showRoot:Boolean = true;
      
      mx_internal var _rootModel:ICollectionView;
      
      private var _labelFunction:Function;
      
      private var keyEquivalentModifiersFunctionChanged:Boolean = false;
      
      private var _keyEquivalentField:String = "keyEquivalent";
      
      public function FlexNativeMenu()
      {
         _nativeMenu = new NativeMenu();
         _dataDescriptor = new DefaultDataDescriptor();
         _keyEquivalentModifiersFunction = keyEquivalentModifiersDefaultFunction;
         super();
         _nativeMenu.addEventListener(Event.DISPLAYING,menuDisplayHandler,false,0,true);
      }
      
      public function get nestLevel() : int
      {
         return _nestLevel;
      }
      
      [Bindable("nativeMenuUpdate")]
      public function get nativeMenu() : NativeMenu
      {
         return _nativeMenu;
      }
      
      public function set nestLevel(param1:int) : void
      {
         _nestLevel = param1;
         invalidateProperties();
      }
      
      public function get updateCompletePendingFlag() : Boolean
      {
         return _updateCompletePendingFlag;
      }
      
      [Bindable("mnemonicIndexFunctionChanged")]
      public function get mnemonicIndexFunction() : Function
      {
         return _mnemonicIndexFunction;
      }
      
      [Bindable("keyEquivalentFunctionChanged")]
      public function get keyEquivalentFunction() : Function
      {
         return _keyEquivalentFunction;
      }
      
      protected function parseLabelToMnemonicIndex(param1:String) : int
      {
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc2_:RegExp = new RegExp(MNEMONIC_INDEX_CHARACTER + MNEMONIC_INDEX_CHARACTER,"g");
         var _loc3_:Array = param1.split(_loc2_);
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            if((_loc8_ = (_loc7_ = String(_loc3_[_loc6_])).indexOf(MNEMONIC_INDEX_CHARACTER)) >= 0)
            {
               return _loc8_ + _loc5_;
            }
            _loc5_ += _loc7_.length + MNEMONIC_INDEX_CHARACTER.length;
            _loc6_++;
         }
         return -1;
      }
      
      public function validateSize(param1:Boolean = false) : void
      {
      }
      
      public function set updateCompletePendingFlag(param1:Boolean) : void
      {
         _updateCompletePendingFlag = param1;
      }
      
      private function clearMenu(param1:NativeMenu) : void
      {
         var _loc2_:int = int(param1.numItems);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.removeItemAt(0);
            _loc3_++;
         }
      }
      
      public function set mnemonicIndexFunction(param1:Function) : void
      {
         if(_mnemonicIndexFunction != param1)
         {
            _mnemonicIndexFunction = param1;
            mnemonicIndexFieldChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("mnemonicIndexFunctionChanged"));
         }
      }
      
      [Bindable("keyEquivalentChanged")]
      public function get keyEquivalentField() : String
      {
         return _keyEquivalentField;
      }
      
      public function set mnemonicIndexField(param1:String) : void
      {
         if(_mnemonicIndexField != param1)
         {
            _mnemonicIndexField = param1;
            mnemonicIndexFieldChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("mnemonicIndexFieldChanged"));
         }
      }
      
      private function itemSelectHandler(param1:Event) : void
      {
         var _loc5_:* = false;
         var _loc2_:NativeMenuItem = param1.target as NativeMenuItem;
         var _loc3_:String = dataDescriptor.getType(_loc2_.data).toLowerCase();
         if(_loc3_ == "check")
         {
            _loc5_ = !dataDescriptor.isToggled(_loc2_.data);
            _loc2_.checked = _loc5_;
            dataDescriptor.setToggled(_loc2_.data,_loc5_);
         }
         var _loc4_:FlexNativeMenuEvent;
         (_loc4_ = new FlexNativeMenuEvent(FlexNativeMenuEvent.ITEM_CLICK)).nativeMenu = _loc2_.menu;
         _loc4_.index = _loc2_.menu.getItemIndex(_loc2_);
         _loc4_.nativeMenuItem = _loc2_;
         _loc4_.label = _loc2_.label;
         _loc4_.item = _loc2_.data;
         dispatchEvent(_loc4_);
      }
      
      [Bindable("keyEquivalentModifiersFunctionChanged")]
      public function get keyEquivalentModifiersFunction() : Function
      {
         return _keyEquivalentModifiersFunction;
      }
      
      public function set keyEquivalentFunction(param1:Function) : void
      {
         if(_keyEquivalentFunction != param1)
         {
            _keyEquivalentFunction = param1;
            keyEquivalentFieldChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("keyEquivalentFunctionChanged"));
         }
      }
      
      private function keyEquivalentModifiersDefaultFunction(param1:Object) : Array
      {
         var i:int = 0;
         var modifier:* = undefined;
         var data:Object = param1;
         var modifiers:Array = [];
         var xmlModifiers:Array = ["@altKey","@cmdKey","@ctrlKey","@shiftKey","@commandKey","@controlKey"];
         var objectModifiers:Array = ["altKey","cmdKey","ctrlKey","shiftKey","commandKey","controlKey"];
         var keyboardModifiers:Array = [Keyboard.ALTERNATE,Keyboard.COMMAND,Keyboard.CONTROL,Keyboard.SHIFT,Keyboard.COMMAND,Keyboard.CONTROL];
         if(data is XML)
         {
            i = 0;
            for(; i < xmlModifiers.length; i++)
            {
               try
               {
                  modifier = data[xmlModifiers[i]];
                  if(modifier[0] == true)
                  {
                     modifiers.push(keyboardModifiers[i]);
                  }
               }
               catch(e:Error)
               {
                  continue;
               }
            }
         }
         else if(data is Object)
         {
            i = 0;
            for(; i < objectModifiers.length; i++)
            {
               try
               {
                  modifier = data[objectModifiers[i]];
                  if(String(modifier).toLowerCase() == "true")
                  {
                     modifiers.push(keyboardModifiers[i]);
                  }
               }
               catch(e:Error)
               {
                  continue;
               }
            }
         }
         return modifiers;
      }
      
      private function menuDisplayHandler(param1:Event) : void
      {
         var _loc2_:NativeMenu = param1.target as NativeMenu;
         var _loc3_:FlexNativeMenuEvent = new FlexNativeMenuEvent(FlexNativeMenuEvent.MENU_SHOW);
         _loc3_.nativeMenu = _loc2_;
         dispatchEvent(_loc3_);
      }
      
      private function populateMenu(param1:NativeMenu, param2:ICollectionView) : NativeMenu
      {
         var menu:NativeMenu = param1;
         var collection:ICollectionView = param2;
         var collectionLength:int = collection.length;
         var i:int = 0;
         while(i < collectionLength)
         {
            try
            {
               insertMenuItem(menu,i,collection[i]);
            }
            catch(e:ItemPendingError)
            {
            }
            i++;
         }
         return menu;
      }
      
      public function set processedDescriptors(param1:Boolean) : void
      {
         _processedDescriptors = param1;
      }
      
      [Bindable("labelFieldChanged")]
      public function get labelField() : String
      {
         return _labelField;
      }
      
      public function set dataDescriptor(param1:IMenuDataDescriptor) : void
      {
         _dataDescriptor = param1;
         dataDescriptorChanged = true;
      }
      
      private function createMenu() : NativeMenu
      {
         var _loc1_:NativeMenu = new NativeMenu();
         _loc1_.addEventListener(Event.DISPLAYING,menuDisplayHandler,false,0,true);
         return _loc1_;
      }
      
      private function collectionChangeHandler(param1:CollectionEvent) : void
      {
         if(param1.kind == CollectionEventKind.ADD)
         {
            dataProviderChanged = true;
            invalidateProperties();
         }
         else if(param1.kind == CollectionEventKind.REMOVE)
         {
            dataProviderChanged = true;
            invalidateProperties();
         }
         else if(param1.kind == CollectionEventKind.REFRESH)
         {
            dataProviderChanged = true;
            dataProvider = dataProvider;
            invalidateProperties();
         }
         else if(param1.kind == CollectionEventKind.RESET)
         {
            dataProviderChanged = true;
            invalidateProperties();
         }
         else if(param1.kind == CollectionEventKind.UPDATE)
         {
            dataProviderChanged = true;
            invalidateProperties();
         }
      }
      
      public function set dataProvider(param1:Object) : void
      {
         var _loc3_:XMLList = null;
         var _loc4_:* = null;
         if(mx_internal::_rootModel)
         {
            mx_internal::_rootModel.removeEventListener(CollectionEvent.COLLECTION_CHANGE,collectionChangeHandler);
         }
         if(typeof param1 == "string")
         {
            param1 = {param1};
         }
         else if(param1 is XMLNode)
         {
            param1 = {XMLNode(param1).toString()};
         }
         else if(param1 is XMLList)
         {
            param1 = new XMLListCollection(param1 as XMLList);
         }
         if(param1 is XML)
         {
            _hasRoot = true;
            _loc3_ = new XMLList();
            _loc3_ += param1;
            mx_internal::_rootModel = new XMLListCollection(_loc3_);
         }
         else if(param1 is ICollectionView)
         {
            mx_internal::_rootModel = ICollectionView(param1);
            if(mx_internal::_rootModel.length == 1)
            {
               _hasRoot = true;
            }
         }
         else if(param1 is Array)
         {
            mx_internal::_rootModel = new ArrayCollection(param1 as Array);
         }
         else if(param1 is Object)
         {
            _hasRoot = true;
            (_loc4_ = []).push(param1);
            mx_internal::_rootModel = new ArrayCollection(_loc4_);
         }
         else
         {
            mx_internal::_rootModel = new ArrayCollection();
         }
         mx_internal::_rootModel.addEventListener(CollectionEvent.COLLECTION_CHANGE,collectionChangeHandler,false,0,true);
         dataProviderChanged = true;
         invalidateProperties();
         var _loc2_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
         _loc2_.kind = CollectionEventKind.RESET;
         collectionChangeHandler(_loc2_);
         dispatchEvent(_loc2_);
      }
      
      public function get showRoot() : Boolean
      {
         return _showRoot;
      }
      
      public function validateDisplayList() : void
      {
      }
      
      protected function parseLabelToString(param1:String) : String
      {
         var _loc7_:String = null;
         var _loc2_:RegExp = new RegExp(MNEMONIC_INDEX_CHARACTER,"g");
         var _loc3_:RegExp = new RegExp(MNEMONIC_INDEX_CHARACTER + MNEMONIC_INDEX_CHARACTER,"g");
         var _loc4_:Array;
         var _loc5_:int = int((_loc4_ = param1.split(_loc3_)).length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = String(_loc4_[_loc6_]);
            _loc4_[_loc6_] = _loc7_.replace(_loc2_,"");
            _loc6_++;
         }
         return _loc4_.join(MNEMONIC_INDEX_CHARACTER);
      }
      
      public function set keyEquivalentModifiersFunction(param1:Function) : void
      {
         if(_keyEquivalentModifiersFunction != param1)
         {
            _keyEquivalentModifiersFunction = param1;
            keyEquivalentModifiersFunctionChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("keyEquivalentModifiersFunctionChanged"));
         }
      }
      
      public function get hasRoot() : Boolean
      {
         return _hasRoot;
      }
      
      public function set keyEquivalentField(param1:String) : void
      {
         if(_keyEquivalentField != param1)
         {
            _keyEquivalentField = param1;
            keyEquivalentFieldChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("keyEquivalentFieldChanged"));
         }
      }
      
      protected function itemToLabel(param1:Object) : String
      {
         var data:Object = param1;
         if(data == null)
         {
            return " ";
         }
         if(labelFunction != null)
         {
            return labelFunction(data);
         }
         if(data is XML)
         {
            try
            {
               if(data[labelField].length() != 0)
               {
                  data = data[labelField];
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(data is Object)
         {
            try
            {
               if(data[labelField] != null)
               {
                  data = data[labelField];
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(data is String)
         {
            return String(data);
         }
         try
         {
            return data.toString();
         }
         catch(e:Error)
         {
            return " ";
         }
      }
      
      public function set initialized(param1:Boolean) : void
      {
         _initialized = param1;
      }
      
      [Bindable("mnemonicIndexChanged")]
      public function get mnemonicIndexField() : String
      {
         return _mnemonicIndexField;
      }
      
      public function get processedDescriptors() : Boolean
      {
         return _processedDescriptors;
      }
      
      public function get dataDescriptor() : IMenuDataDescriptor
      {
         return IMenuDataDescriptor(_dataDescriptor);
      }
      
      [Bindable("collectionChange")]
      public function get dataProvider() : Object
      {
         if(mx_internal::_rootModel)
         {
            return mx_internal::_rootModel;
         }
         return null;
      }
      
      public function display(param1:Stage, param2:int, param3:int) : void
      {
         nativeMenu.display(param1,param2,param3);
      }
      
      protected function commitProperties() : void
      {
         var _loc1_:ICollectionView = null;
         var _loc2_:* = undefined;
         if(showRootChanged)
         {
            if(!_hasRoot)
            {
               showRootChanged = false;
            }
         }
         if(dataProviderChanged || showRootChanged || labelFieldChanged || dataDescriptorChanged)
         {
            dataProviderChanged = false;
            showRootChanged = false;
            labelFieldChanged = false;
            dataDescriptorChanged = false;
            if(mx_internal::_rootModel && !_showRoot && _hasRoot)
            {
               _loc2_ = mx_internal::_rootModel.createCursor().current;
               if(_loc2_ != null && _dataDescriptor.isBranch(_loc2_,mx_internal::_rootModel) && _dataDescriptor.hasChildren(_loc2_,mx_internal::_rootModel))
               {
                  _loc1_ = _dataDescriptor.getChildren(_loc2_,mx_internal::_rootModel);
               }
            }
            clearMenu(_nativeMenu);
            if(mx_internal::_rootModel)
            {
               if(!_loc1_)
               {
                  _loc1_ = mx_internal::_rootModel;
               }
               _loc1_.addEventListener(CollectionEvent.COLLECTION_CHANGE,collectionChangeHandler,false,EventPriority.DEFAULT_HANDLER,true);
               populateMenu(_nativeMenu,_loc1_);
            }
            dispatchEvent(new Event("nativeMenuChange"));
         }
      }
      
      public function unsetContextMenu(param1:InteractiveObject) : void
      {
         param1.contextMenu = null;
      }
      
      public function invalidateProperties() : void
      {
         var _loc1_:Timer = null;
         if(!invalidatePropertiesFlag && nestLevel > 0)
         {
            invalidatePropertiesFlag = true;
            if(false)
            {
               UIComponentGlobals.mx_internal::layoutManager.invalidateProperties(this);
            }
            else
            {
               _loc1_ = new Timer(100,1);
               _loc1_.addEventListener(TimerEvent.TIMER,validatePropertiesTimerHandler);
               _loc1_.start();
            }
         }
      }
      
      public function set labelField(param1:String) : void
      {
         if(_labelField != param1)
         {
            _labelField = param1;
            labelFieldChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("labelFieldChanged"));
         }
      }
      
      public function get initialized() : Boolean
      {
         return _initialized;
      }
      
      public function validatePropertiesTimerHandler(param1:TimerEvent) : void
      {
         validateProperties();
      }
      
      public function set labelFunction(param1:Function) : void
      {
         if(_labelFunction != param1)
         {
            _labelFunction = param1;
            labelFieldChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("labelFunctionChanged"));
         }
      }
      
      protected function itemToKeyEquivalentModifiers(param1:Object) : Array
      {
         if(param1 == null)
         {
            return [];
         }
         if(keyEquivalentModifiersFunction != null)
         {
            return keyEquivalentModifiersFunction(param1);
         }
         return [];
      }
      
      protected function itemToKeyEquivalent(param1:Object) : String
      {
         var data:Object = param1;
         if(data == null)
         {
            return "";
         }
         if(keyEquivalentFunction != null)
         {
            return keyEquivalentFunction(data);
         }
         if(data is XML)
         {
            try
            {
               if(data[keyEquivalentField].length() != 0)
               {
                  data = data[keyEquivalentField];
                  return data.toString();
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(data is Object)
         {
            try
            {
               if(data[keyEquivalentField] != null)
               {
                  data = data[keyEquivalentField];
                  return data.toString();
               }
            }
            catch(e:Error)
            {
            }
         }
         return "";
      }
      
      public function validateNow() : void
      {
         if(invalidatePropertiesFlag)
         {
            validateProperties();
         }
      }
      
      private function insertMenuItem(param1:NativeMenu, param2:int, param3:Object) : void
      {
         var _loc7_:String = null;
         var _loc8_:int = 0;
         if(dataProviderChanged)
         {
            commitProperties();
            return;
         }
         var _loc4_:String;
         var _loc5_:* = (_loc4_ = dataDescriptor.getType(param3).toLowerCase()) == "separator";
         var _loc6_:NativeMenuItem = new NativeMenuItem("",_loc5_);
         if(!_loc5_)
         {
            _loc6_.enabled = dataDescriptor.isEnabled(param3);
            _loc6_.checked = _loc4_ == "check" && dataDescriptor.isToggled(param3);
            _loc6_.data = dataDescriptor.getData(param3,mx_internal::_rootModel);
            _loc6_.keyEquivalent = itemToKeyEquivalent(param3);
            _loc6_.keyEquivalentModifiers = itemToKeyEquivalentModifiers(param3);
            _loc7_ = itemToLabel(param3);
            if((_loc8_ = itemToMnemonicIndex(param3)) >= 0)
            {
               _loc6_.label = parseLabelToString(_loc7_);
               _loc6_.mnemonicIndex = _loc8_;
            }
            else
            {
               _loc6_.label = parseLabelToString(_loc7_);
               _loc6_.mnemonicIndex = parseLabelToMnemonicIndex(_loc7_);
            }
            _loc6_.addEventListener(Event.SELECT,itemSelectHandler,false,0,true);
            if(dataDescriptor.isBranch(param3,mx_internal::_rootModel) && dataDescriptor.hasChildren(param3,mx_internal::_rootModel))
            {
               _loc6_.submenu = createMenu();
               populateMenu(_loc6_.submenu,dataDescriptor.getChildren(param3,mx_internal::_rootModel));
            }
         }
         param1.addItem(_loc6_);
      }
      
      public function setContextMenu(param1:InteractiveObject) : void
      {
         var _loc2_:ISystemManager = null;
         param1.contextMenu = nativeMenu;
         if(param1 is Application)
         {
            _loc2_ = Application(param1).systemManager;
            if(_loc2_ is InteractiveObject)
            {
               InteractiveObject(_loc2_).contextMenu = nativeMenu;
            }
         }
      }
      
      protected function itemToMnemonicIndex(param1:Object) : int
      {
         var mnemonicIndex:int = 0;
         var data:Object = param1;
         if(data == null)
         {
            return -1;
         }
         if(mnemonicIndexFunction != null)
         {
            return mnemonicIndexFunction(data);
         }
         if(data is XML)
         {
            try
            {
               if(data[mnemonicIndexField].length() != 0)
               {
                  mnemonicIndex = int(data[mnemonicIndexField]);
                  return mnemonicIndex;
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(data is Object)
         {
            try
            {
               if(data[mnemonicIndexField] != null)
               {
                  mnemonicIndex = int(data[mnemonicIndexField]);
                  return mnemonicIndex;
               }
            }
            catch(e:Error)
            {
            }
         }
         return -1;
      }
      
      public function validateProperties() : void
      {
         if(invalidatePropertiesFlag)
         {
            commitProperties();
            invalidatePropertiesFlag = false;
         }
      }
      
      [Bindable("labelFunctionChanged")]
      public function get labelFunction() : Function
      {
         return _labelFunction;
      }
      
      public function set showRoot(param1:Boolean) : void
      {
         if(_showRoot != param1)
         {
            showRootChanged = true;
            _showRoot = param1;
            invalidateProperties();
         }
      }
   }
}
