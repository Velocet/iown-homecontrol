package mx.managers
{
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import mx.core.ApplicationGlobals;
   import mx.core.mx_internal;
   import mx.events.BrowserChangeEvent;
   
   public class BrowserManagerImpl extends EventDispatcher implements mx.managers.IBrowserManager
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var instance:mx.managers.IBrowserManager;
       
      
      private var _title:String;
      
      private var _isFirefoxMac:Boolean;
      
      private var browserMode:Boolean = true;
      
      private var _fragment:String;
      
      private var _base:String;
      
      private var _browserUserAgent:String;
      
      private var _url:String;
      
      private var _defaultFragment:String = "";
      
      private var _browserPlatform:String;
      
      public function BrowserManagerImpl()
      {
         var systemManager:Object;
         var sandboxRoot:Object = null;
         var parent:Object = null;
         super();
         systemManager = SystemManagerGlobals.topLevelSystemManagers;
         if(systemManager)
         {
            systemManager = systemManager[0];
         }
         if(systemManager)
         {
            sandboxRoot = systemManager.getSandboxRoot();
            if(!sandboxRoot.dispatchEvent(new Event("mx.managers::BrowserManager",false,true)))
            {
               browserMode = false;
               return;
            }
            try
            {
               parent = sandboxRoot.parent;
               while(parent)
               {
                  if(sandboxRoot.parent is Stage)
                  {
                     break;
                  }
                  parent = parent.parent;
               }
            }
            catch(e:Error)
            {
               browserMode = false;
               return;
            }
            sandboxRoot.addEventListener("mx.managers::BrowserManager",sandboxBrowserManagerHandler,false,0,true);
         }
         try
         {
            ExternalInterface.addCallback("browserURLChange",browserURLChangeBrowser);
            ExternalInterface.addCallback("debugTrace",debugTrace);
         }
         catch(e:Error)
         {
            browserMode = false;
         }
      }
      
      public static function getInstance() : mx.managers.IBrowserManager
      {
         if(!instance)
         {
            instance = new BrowserManagerImpl();
         }
         return instance;
      }
      
      public function initForHistoryManager() : void
      {
         setup("","");
      }
      
      private function setup(param1:String, param2:String) : void
      {
         if(!browserMode)
         {
            return;
         }
         _defaultFragment = param1;
         _url = ExternalInterface.call("BrowserHistory.getURL");
         if(!_url)
         {
            browserMode = false;
            return;
         }
         _browserUserAgent = ExternalInterface.call("BrowserHistory.getUserAgent");
         _browserPlatform = ExternalInterface.call("BrowserHistory.getPlatform");
         _isFirefoxMac = _browserUserAgent && _browserPlatform && _browserUserAgent.indexOf("Firefox") > -1 && _browserPlatform.indexOf("Mac") > -1;
         var _loc3_:int = _url.indexOf("#");
         if(_loc3_ == -1 || _loc3_ == -1)
         {
            _base = _url;
            _fragment = "";
            _title = param2;
            ExternalInterface.call("BrowserHistory.setDefaultURL",param1);
            setTitle(param2);
         }
         else
         {
            _base = _url.substring(0,_loc3_);
            _fragment = _url.substring(_loc3_ + 1);
            _title = ExternalInterface.call("BrowserHistory.getTitle");
            ExternalInterface.call("BrowserHistory.setDefaultURL",_fragment);
            if(_fragment != _defaultFragment)
            {
               browserURLChange(_fragment,true);
            }
         }
      }
      
      private function browserURLChange(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:String = null;
         if(param1 != null && decodeURI(_fragment) != decodeURI(param1) || param2)
         {
            _fragment = param1;
            _loc3_ = url;
            _url = _base + "#" + param1;
            dispatchEvent(new BrowserChangeEvent(BrowserChangeEvent.BROWSER_URL_CHANGE,false,false,url,_loc3_));
            dispatchEvent(new BrowserChangeEvent(BrowserChangeEvent.URL_CHANGE,false,false,url,_loc3_));
         }
      }
      
      [Bindable("urlChange")]
      public function get base() : String
      {
         return _base;
      }
      
      public function setFragment(param1:String) : void
      {
         var _loc4_:URLRequest = null;
         if(!browserMode)
         {
            return;
         }
         var _loc2_:String = _url;
         var _loc3_:String = _fragment;
         _url = base + "#" + param1;
         _fragment = param1;
         if(dispatchEvent(new BrowserChangeEvent(BrowserChangeEvent.APPLICATION_URL_CHANGE,false,true,_url,_loc2_)))
         {
            if(!_isFirefoxMac)
            {
               ExternalInterface.call("BrowserHistory.setBrowserURL",param1,ExternalInterface.objectID);
            }
            else
            {
               _loc4_ = new URLRequest("javascript:BrowserHistory.setBrowserURL(\'" + param1 + "\',\'" + ExternalInterface.objectID + "\');");
               navigateToURL(_loc4_,"_self");
            }
            dispatchEvent(new BrowserChangeEvent(BrowserChangeEvent.URL_CHANGE,false,false,_url,_loc2_));
         }
         else
         {
            _fragment = _loc3_;
            _url = _loc2_;
         }
      }
      
      private function debugTrace(param1:String) : void
      {
         trace(param1);
      }
      
      [Bindable("urlChange")]
      public function get fragment() : String
      {
         if(Boolean(_fragment) && false)
         {
            return _fragment;
         }
         return _defaultFragment;
      }
      
      [Bindable("urlChange")]
      public function get title() : String
      {
         return _title;
      }
      
      public function setTitle(param1:String) : void
      {
         if(!browserMode)
         {
            return;
         }
         ExternalInterface.call("BrowserHistory.setTitle",param1);
         _title = ExternalInterface.call("BrowserHistory.getTitle");
      }
      
      public function init(param1:String = "", param2:String = "") : void
      {
         ApplicationGlobals.application.historyManagementEnabled = false;
         setup(param1,param2);
      }
      
      private function sandboxBrowserManagerHandler(param1:Event) : void
      {
         param1.preventDefault();
      }
      
      private function browserURLChangeBrowser(param1:String) : void
      {
         browserURLChange(param1,false);
      }
      
      [Bindable("urlChange")]
      public function get url() : String
      {
         return _url;
      }
   }
}
