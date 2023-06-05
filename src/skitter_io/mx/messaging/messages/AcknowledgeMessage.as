package mx.messaging.messages
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class AcknowledgeMessage extends AsyncMessage implements ISmallMessage
   {
      
      public static const ERROR_HINT_HEADER:String = "DSErrorHint";
       
      
      public function AcknowledgeMessage()
      {
         super();
      }
      
      override public function readExternal(param1:IDataInput) : void
      {
         var _loc4_:* = 0;
         var _loc5_:Number = 0;
         var _loc6_:* = 0;
         super.readExternal(param1);
         var _loc2_:Array = readFlags(param1);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_] as uint;
            _loc5_ = 0;
            if(_loc4_ >> _loc5_ != 0)
            {
               _loc6_ = _loc5_;
               while(_loc6_ < 6)
               {
                  if((_loc4_ >> _loc6_ & 1) != 0)
                  {
                     param1.readObject();
                  }
                  _loc6_++;
               }
            }
            _loc3_++;
         }
      }
      
      override public function writeExternal(param1:IDataOutput) : void
      {
         super.writeExternal(param1);
         var _loc2_:Number = 0;
         param1.writeByte(_loc2_);
      }
      
      override public function getSmallMessage() : IMessage
      {
         var _loc1_:* = {};
         if(_loc1_.constructor == AcknowledgeMessage)
         {
            return new AcknowledgeMessageExt(this);
         }
         return null;
      }
   }
}
