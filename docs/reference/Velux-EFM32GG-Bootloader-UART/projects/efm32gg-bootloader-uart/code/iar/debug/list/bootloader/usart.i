 












 

 





































 


 




























 

#pragma system_include        



 


 

 


 

 
typedef enum IRQn{
 
  NonMaskableInt_IRQn   = -14,               
  HardFault_IRQn        = -13,               
  MemoryManagement_IRQn = -12,               
  BusFault_IRQn         = -11,               
  UsageFault_IRQn       = -10,               
  SVCall_IRQn           = -5,                
  DebugMonitor_IRQn     = -4,                
  PendSV_IRQn           = -2,                
  SysTick_IRQn          = -1,                

 
  DMA_IRQn              = 0,   
  GPIO_EVEN_IRQn        = 1,   
  TIMER0_IRQn           = 2,   
  USART0_RX_IRQn        = 3,   
  USART0_TX_IRQn        = 4,   
  ACMP0_IRQn            = 6,   
  ADC0_IRQn             = 7,   
  DAC0_IRQn             = 8,   
  I2C0_IRQn             = 9,   
  I2C1_IRQn             = 10,  
  GPIO_ODD_IRQn         = 11,  
  TIMER1_IRQn           = 12,  
  TIMER2_IRQn           = 13,  
  TIMER3_IRQn           = 14,  
  USART1_RX_IRQn        = 15,  
  USART1_TX_IRQn        = 16,  
  LESENSE_IRQn          = 17,  
  USART2_RX_IRQn        = 18,  
  USART2_TX_IRQn        = 19,  
  LEUART0_IRQn          = 24,  
  LEUART1_IRQn          = 25,  
  LETIMER0_IRQn         = 26,  
  PCNT0_IRQn            = 27,  
  PCNT1_IRQn            = 28,  
  PCNT2_IRQn            = 29,  
  RTC_IRQn              = 30,  
  BURTC_IRQn            = 31,  
  CMU_IRQn              = 32,  
  VCMP_IRQn             = 33,  
  MSC_IRQn              = 35,  
  AES_IRQn              = 36,  
  EMU_IRQn              = 38,  
} IRQn_Type;

 



 

 

 


 

 

 

 

 

 

 

 
 

 


 




 
















 

  #pragma system_include          


 
 

  #pragma system_include

 
 

 

  #pragma system_include














 


 
 


  #pragma system_include

 



 

 

 

 
#pragma rtmodel = "__dlib_version", "6"

 


 



























 


  #pragma system_include

 
 
 


  #pragma system_include

 

   

 
 


   #pragma system_include






 




 


 


 


 

 


 

 

 

 

 

 

 

 

 

 
















 



















 











 























 





 



 










 














 













 








 













 













 















 











 








 








 






 





 












 





 













 






 


   


  







 







 




 






 




 




 













 

   




 







 







 







 










 





 

















 


 


 













 

   


 


 



 

 

 
  typedef unsigned int _Wchart;
  typedef unsigned int _Wintt;

 

 
typedef unsigned int     _Sizet;

 
typedef signed char   __int8_t;
typedef unsigned char  __uint8_t;
typedef signed short int   __int16_t;
typedef unsigned short int  __uint16_t;
typedef signed int   __int32_t;
typedef unsigned int  __uint32_t;
   typedef signed long long int   __int64_t;
   typedef unsigned long long int  __uint64_t;
typedef signed int   __intptr_t;
typedef unsigned int  __uintptr_t;

 
typedef struct _Mbstatet
{  
    unsigned int _Wchar;   
    unsigned int _State;   

} _Mbstatet;

 

 
  typedef struct __va_list __Va_list;



 
typedef struct
{
    long long _Off;     
  _Mbstatet _Wstate;
} _Fpost;


 

 
  
   
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_StaticGuard(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_StaticGuard(void);


  typedef void *__iar_Rmtx;

  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Initdynamiclock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Dstdynamiclock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Lockdynamiclock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlockdynamiclock(__iar_Rmtx *);

  






 


 
  typedef signed char          int8_t;
  typedef unsigned char        uint8_t;

  typedef signed short int         int16_t;
  typedef unsigned short int       uint16_t;

  typedef signed int         int32_t;
  typedef unsigned int       uint32_t;

  typedef signed long long int         int64_t;
  typedef unsigned long long int       uint64_t;


 
typedef signed char      int_least8_t;
typedef unsigned char    uint_least8_t;

typedef signed short int     int_least16_t;
typedef unsigned short int   uint_least16_t;

typedef signed int     int_least32_t;
typedef unsigned int   uint_least32_t;

 
  typedef signed long long int   int_least64_t;
  typedef unsigned long long int uint_least64_t;



 
typedef signed int       int_fast8_t;
typedef unsigned int     uint_fast8_t;

typedef signed int      int_fast16_t;
typedef unsigned int    uint_fast16_t;

typedef signed int      int_fast32_t;
typedef unsigned int    uint_fast32_t;

  typedef signed long long int    int_fast64_t;
  typedef unsigned long long int  uint_fast64_t;

 
typedef signed long long int          intmax_t;
typedef unsigned long long int        uintmax_t;


 
typedef signed int          intptr_t;
typedef unsigned int        uintptr_t;

 
typedef int __data_intptr_t; typedef unsigned int __data_uintptr_t;

 






















 











 














 




 



 

 




 
















 

  #pragma system_include          


 
 
 




 



 




 
















 





 
 




 





















#pragma system_include






 

 















#pragma language=save
#pragma language=extended
_Pragma("inline=forced") __intrinsic uint16_t __iar_uint16_read(void const *ptr)
{
  return *(__packed uint16_t*)(ptr);
}
#pragma language=restore


#pragma language=save
#pragma language=extended
_Pragma("inline=forced") __intrinsic void __iar_uint16_write(void const *ptr, uint16_t val)
{
  *(__packed uint16_t*)(ptr) = val;;
}
#pragma language=restore

#pragma language=save
#pragma language=extended
_Pragma("inline=forced") __intrinsic uint32_t __iar_uint32_read(void const *ptr)
{
  return *(__packed uint32_t*)(ptr);
}
#pragma language=restore

#pragma language=save
#pragma language=extended
_Pragma("inline=forced") __intrinsic void __iar_uint32_write(void const *ptr, uint32_t val)
{
  *(__packed uint32_t*)(ptr) = val;;
}
#pragma language=restore

#pragma language=save
#pragma language=extended
__packed struct  __iar_u32 { uint32_t v; };
#pragma language=restore















 



  #pragma system_include



 


 


#pragma language=save
#pragma language=extended

__intrinsic __nounwind void    __iar_builtin_no_operation(void);

__intrinsic __nounwind void    __iar_builtin_disable_interrupt(void);
__intrinsic __nounwind void    __iar_builtin_enable_interrupt(void);

typedef unsigned int __istate_t;

__intrinsic __nounwind __istate_t __iar_builtin_get_interrupt_state(void);
__intrinsic __nounwind void __iar_builtin_set_interrupt_state(__istate_t);

 
__intrinsic __nounwind unsigned int __iar_builtin_get_PSR( void );
__intrinsic __nounwind unsigned int __iar_builtin_get_IPSR( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_MSP( void );
__intrinsic __nounwind void         __iar_builtin_set_MSP( unsigned int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_PSP( void );
__intrinsic __nounwind void         __iar_builtin_set_PSP( unsigned int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_PRIMASK( void );
__intrinsic __nounwind void         __iar_builtin_set_PRIMASK( unsigned int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_CONTROL( void );
__intrinsic __nounwind void         __iar_builtin_set_CONTROL( unsigned int );

 
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_FAULTMASK( void );
__intrinsic __nounwind void         __iar_builtin_set_FAULTMASK(unsigned int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_BASEPRI( void );
__intrinsic __nounwind void         __iar_builtin_set_BASEPRI( unsigned int );

 
__intrinsic __nounwind void __iar_builtin_disable_irq(void);
__intrinsic __nounwind void __iar_builtin_enable_irq(void);

__intrinsic __nounwind void __iar_builtin_disable_fiq(void);
__intrinsic __nounwind void __iar_builtin_enable_fiq(void);


 

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SWP( unsigned int, volatile unsigned int * );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned char __iar_builtin_SWPB( unsigned char, volatile unsigned char * );

typedef unsigned int __ul;
typedef unsigned int __iar_builtin_uint;


 

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void __iar_builtin_CDP (unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) opc1, unsigned __constrange(0,15) CRd, unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opc2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void __iar_builtin_CDP2(unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) opc1, unsigned __constrange(0,15) CRd, unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opc2);

 
__intrinsic __nounwind void          __iar_builtin_MCR( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __iar_builtin_uint src,
                                unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind unsigned int __iar_builtin_MRC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind void          __iar_builtin_MCR2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __iar_builtin_uint src,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind unsigned int __iar_builtin_MRC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );

__intrinsic __nounwind void __iar_builtin_MCRR (unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opc1, unsigned long long src, unsigned __constrange(0,15) CRm);
__intrinsic __nounwind void __iar_builtin_MCRR2(unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opc1, unsigned long long src, unsigned __constrange(0,15) CRm);

__intrinsic __nounwind unsigned long long __iar_builtin_MRRC (unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opc1, unsigned __constrange(0,15) CRm);
__intrinsic __nounwind unsigned long long __iar_builtin_MRRC2(unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opc1, unsigned __constrange(0,15) CRm);

 
__intrinsic __nounwind void __iar_builtin_LDC  ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src);
__intrinsic __nounwind void __iar_builtin_LDCL ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src);
__intrinsic __nounwind void __iar_builtin_LDC2 ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src);
__intrinsic __nounwind void __iar_builtin_LDC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src);

 
__intrinsic __nounwind void __iar_builtin_STC  ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst);
__intrinsic __nounwind void __iar_builtin_STCL ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst);
__intrinsic __nounwind void __iar_builtin_STC2 ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst);
__intrinsic __nounwind void __iar_builtin_STC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst);

 
__intrinsic __nounwind void __iar_builtin_LDC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_LDCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_LDC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_LDC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src,
                                unsigned __constrange(0,255) option);

 
__intrinsic __nounwind void __iar_builtin_STC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_STCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_STC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_STC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst,
                                unsigned __constrange(0,255) option);


 
__intrinsic __nounwind unsigned int       __iar_builtin_rsr(__spec_string const char * special_register);
__intrinsic __nounwind unsigned long long __iar_builtin_rsr64(__spec_string const char * special_register);
__intrinsic __nounwind void*              __iar_builtin_rsrp(__spec_string const char * special_register);

 
__intrinsic __nounwind void __iar_builtin_wsr(__spec_string const char * special_register, unsigned int value);
__intrinsic __nounwind void __iar_builtin_wsr64(__spec_string const char * special_register, unsigned long long value);
__intrinsic __nounwind void __iar_builtin_wsrp(__spec_string const char * special_register, const void *value);

 
__intrinsic __nounwind unsigned int __iar_builtin_get_APSR( void );
__intrinsic __nounwind void         __iar_builtin_set_APSR( unsigned int );

 
__intrinsic __nounwind unsigned int __iar_builtin_get_CPSR( void );
__intrinsic __nounwind void         __iar_builtin_set_CPSR( unsigned int );

 
__intrinsic __nounwind unsigned int __iar_builtin_get_FPSCR( void );
__intrinsic __nounwind void __iar_builtin_set_FPSCR( unsigned int );

 
 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CLZ(unsigned int);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_ROR(unsigned int, unsigned int);
__intrinsic __nounwind unsigned int __iar_builtin_RRX(unsigned int);

 
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QADD( signed int, signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QDADD( signed int, signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QSUB( signed int, signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QDSUB( signed int, signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QDOUBLE( signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int        __iar_builtin_QFlag( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int   __iar_builtin_acle_QFlag(void);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void  __iar_builtin_set_QFlag(int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void  __iar_builtin_ignore_QFlag(void);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int         __iar_builtin_QCFlag( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void __iar_builtin_reset_QC_flag( void );

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_SMUL( signed short, signed short );

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_REV( unsigned int );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_REVSH( short );

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_REV16( unsigned int );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_RBIT( unsigned int );

__intrinsic __nounwind unsigned char  __iar_builtin_LDREXB( volatile unsigned char const * );
__intrinsic __nounwind unsigned short __iar_builtin_LDREXH( volatile unsigned short const * );
__intrinsic __nounwind unsigned int  __iar_builtin_LDREX ( volatile unsigned int const * );
__intrinsic __nounwind unsigned long long __iar_builtin_LDREXD( volatile unsigned long long const * );

__intrinsic __nounwind unsigned int  __iar_builtin_STREXB( unsigned char, volatile unsigned char * );
__intrinsic __nounwind unsigned int  __iar_builtin_STREXH( unsigned short, volatile unsigned short * );
__intrinsic __nounwind unsigned int  __iar_builtin_STREX ( unsigned int, volatile unsigned int * );
__intrinsic __nounwind unsigned int  __iar_builtin_STREXD( unsigned long long, volatile unsigned long long * );

__intrinsic __nounwind void __iar_builtin_CLREX( void );

__intrinsic __nounwind void __iar_builtin_SEV( void );
__intrinsic __nounwind void __iar_builtin_WFE( void );
__intrinsic __nounwind void __iar_builtin_WFI( void );
__intrinsic __nounwind void __iar_builtin_YIELD( void );

__intrinsic __nounwind void __iar_builtin_PLI( volatile void const * );
__intrinsic __nounwind void __iar_builtin_PLD( volatile void const * );

__intrinsic __nounwind void __iar_builtin_PLIx( volatile void const *, unsigned int __constrange(0,2), unsigned int __constrange(0,1));
__intrinsic __nounwind void __iar_builtin_PLDx( volatile void const *, unsigned int __constrange(0, 1), unsigned int __constrange(0, 2), unsigned int __constrange(0, 1));
__intrinsic __nounwind void __iar_builtin_PLDW( volatile void const * );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int   __iar_builtin_SSAT     (signed int val, unsigned int __constrange( 1, 32 ) sat );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USAT     (signed int val, unsigned int __constrange( 0, 31 ) sat );

 
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SEL( unsigned int op1, unsigned int op2 );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SADD8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SADD16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSUB8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSUB16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SADDSUBX (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSUBADDX (unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHADD8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHADD16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHSUB8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHSUB16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHADDSUBX(unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHSUBADDX(unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QADD8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QADD16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QSUB8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QSUB16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QADDSUBX (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QSUBADDX (unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UADD8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UADD16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USUB8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USUB16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UADDSUBX (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USUBADDX (unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHADD8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHADD16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHSUB8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHSUB16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHADDSUBX(unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHSUBADDX(unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQADD8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQADD16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQSUB8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQSUB16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQADDSUBX(unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQSUBADDX(unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USAD8(unsigned int x, unsigned int y );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USADA8(unsigned int x, unsigned int y,
                                   unsigned int acc );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSAT16   (unsigned int pair,
                                      unsigned int __constrange( 1, 16 ) sat );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USAT16   (unsigned int pair,
                                      unsigned int __constrange( 0, 15 ) sat );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMUAD (unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMUSD (unsigned int x, unsigned int y);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMUADX(unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMUSDX(unsigned int x, unsigned int y);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLAD (unsigned int x, unsigned int y, int sum);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLSD (unsigned int x, unsigned int y, int sum);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLADX(unsigned int x, unsigned int y, int sum);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLSDX(unsigned int x, unsigned int y, int sum);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALD (unsigned int pair1,
                                 unsigned int pair2,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALDX(unsigned int pair1,
                                 unsigned int pair2,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLSLD (unsigned int pair1,
                                 unsigned int pair2,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLSLDX(unsigned int pair1,
                                 unsigned int pair2,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_PKHBT(unsigned int x,
                                  unsigned int y,
                                  unsigned __constrange(0,31) count);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_PKHTB(unsigned int x,
                                  unsigned int y,
                                  unsigned __constrange(0,32) count);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLABB(unsigned int x, unsigned int y, int acc);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLABT(unsigned int x, unsigned int y, int acc);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLATB(unsigned int x, unsigned int y, int acc);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLATT(unsigned int x, unsigned int y, int acc);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLAWB(int x, unsigned int y, int acc);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLAWT(int x, unsigned int y, int acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMLA (int x, int y, int acc);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMLAR(int x, int y, int acc);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMLS (int x, int y, int acc);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMLSR(int x, int y, int acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMUL (int x, int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMULR(int x, int y);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULBB(unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULBT(unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULTB(unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULTT(unsigned int x, unsigned int y);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULWB(int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULWT(int x, unsigned int y);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SXTAB (int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SXTAH (int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UXTAB (unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UXTAH (unsigned int x, unsigned int y);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long long __iar_builtin_UMAAL(unsigned int x,
                                       unsigned int y,
                                       unsigned int a,
                                       unsigned int b);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALBB(unsigned int x,
                                 unsigned int y,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALBT(unsigned int x,
                                 unsigned int y,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALTB(unsigned int x,
                                 unsigned int y,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALTT(unsigned int x,
                                 unsigned int y,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UXTB16(unsigned int x);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UXTAB16(unsigned int acc, unsigned int x);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SXTB16(unsigned int x);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SXTAB16(unsigned int acc, unsigned int x);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SASX(unsigned int, unsigned int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSAX(unsigned int, unsigned int);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHASX(unsigned int, unsigned int);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHSAX(unsigned int, unsigned int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QASX(unsigned int, unsigned int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QSAX(unsigned int, unsigned int);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UASX(unsigned int, unsigned int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USAX(unsigned int, unsigned int);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHASX(unsigned int, unsigned int);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHSAX(unsigned int, unsigned int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQASX(unsigned int, unsigned int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQSAX(unsigned int, unsigned int);

 
__intrinsic __nounwind void __iar_builtin_DMB(void);
__intrinsic __nounwind void __iar_builtin_DSB(void);
__intrinsic __nounwind void __iar_builtin_ISB(void);
__intrinsic __nounwind void __iar_builtin_DMBx(unsigned int __constrange(1, 15));
__intrinsic __nounwind void __iar_builtin_DSBx(unsigned int __constrange(1, 15));
__intrinsic __nounwind void __iar_builtin_ISBx(unsigned int __constrange(1, 15));

 
__intrinsic __nounwind unsigned int __iar_builtin_TT(unsigned int);
__intrinsic __nounwind unsigned int __iar_builtin_TTT(unsigned int);
__intrinsic __nounwind unsigned int __iar_builtin_TTA(unsigned int);
__intrinsic __nounwind unsigned int __iar_builtin_TTAT(unsigned int);

__intrinsic __nounwind unsigned int __get_LR(void);
__intrinsic __nounwind void __set_LR(unsigned int);

__intrinsic __nounwind unsigned int __get_SP(void);
__intrinsic __nounwind void __set_SP(unsigned int);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VSQRT_F32(float x);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VSQRT_F64(double x);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VFMA_F32(float x, float y, float z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VFMS_F32(float x, float y, float z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VFNMA_F32(float x, float y, float z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VFNMS_F32(float x, float y, float z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VFMA_F64(double x, double y, double z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VFMS_F64(double x, double y, double z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VFNMA_F64(double x, double y, double z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VFNMS_F64(double x, double y, double z);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32B(unsigned int crc, unsigned char data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32H(unsigned int crc, unsigned short data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32W(unsigned int crc, unsigned int data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32CB(unsigned int crc, unsigned char data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32CH(unsigned int crc, unsigned short data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32CW(unsigned int crc, unsigned int data);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VMAXNM_F32(float a, float b);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VMINNM_F32(float a, float b);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VMAXNM_F64(double a, double b);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VMINNM_F64(double a, double b);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTA_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTM_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTN_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTP_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTX_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTR_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTZ_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTA_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTM_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTN_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTP_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTX_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTR_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTZ_F64(double a);

#pragma language=restore









    

    



    
    







  _Pragma("inline=forced") __intrinsic int16_t __REVSH(int16_t val)
  {
    return (int16_t) __iar_builtin_REVSH(val);
  }












  _Pragma("inline=forced") __intrinsic uint8_t __LDRBT(volatile uint8_t *addr)
  {
    uint32_t res;
    __asm("LDRBT %0, [%1]" : "=r" (res) : "r" (addr) : "memory");
    return ((uint8_t)res);
  }

  _Pragma("inline=forced") __intrinsic uint16_t __LDRHT(volatile uint16_t *addr)
  {
    uint32_t res;
    __asm("LDRHT %0, [%1]" : "=r" (res) : "r" (addr) : "memory");
    return ((uint16_t)res);
  }

  _Pragma("inline=forced") __intrinsic uint32_t __LDRT(volatile uint32_t *addr)
  {
    uint32_t res;
    __asm("LDRT %0, [%1]" : "=r" (res) : "r" (addr) : "memory");
    return res;
  }

  _Pragma("inline=forced") __intrinsic void __STRBT(uint8_t value, volatile uint8_t *addr)
  {
    __asm("STRBT %1, [%0]" : : "r" (addr), "r" ((uint32_t)value) : "memory");
  }

  _Pragma("inline=forced") __intrinsic void __STRHT(uint16_t value, volatile uint16_t *addr)
  {
    __asm("STRHT %1, [%0]" : : "r" (addr), "r" ((uint32_t)value) : "memory");
  }

  _Pragma("inline=forced") __intrinsic void __STRT(uint32_t value, volatile uint32_t *addr)
  {
    __asm("STRT %1, [%0]" : : "r" (addr), "r" (value) : "memory");
  }




#pragma diag_default=Pe940
#pragma diag_default=Pe177





 










 

 






 

 

 












 



 






 



 
typedef union
{
  struct
  {
    uint32_t _reserved0:27;               
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} APSR_Type;

 








 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:23;               
  } b;                                    
  uint32_t w;                             
} IPSR_Type;

 




 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:1;                
    uint32_t ICI_IT_1:6;                  
    uint32_t _reserved1:8;                
    uint32_t T:1;                         
    uint32_t ICI_IT_2:2;                  
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} xPSR_Type;

 












 
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                     
    uint32_t SPSEL:1;                     
    uint32_t _reserved1:30;               
  } b;                                    
  uint32_t w;                             
} CONTROL_Type;

 


 







 



 
typedef struct
{
  volatile uint32_t ISER[8U];                
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];                
        uint32_t RSERVED1[24U];
  volatile uint32_t ISPR[8U];                
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];                
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];                
        uint32_t RESERVED4[56U];
  volatile uint8_t  IP[240U];                
        uint32_t RESERVED5[644U];
  volatile  uint32_t STIR;                    
}  NVIC_Type;

 

 







 



 
typedef struct
{
  volatile const  uint32_t CPUID;                   
  volatile uint32_t ICSR;                    
  volatile uint32_t VTOR;                    
  volatile uint32_t AIRCR;                   
  volatile uint32_t SCR;                     
  volatile uint32_t CCR;                     
  volatile uint8_t  SHP[12U];                
  volatile uint32_t SHCSR;                   
  volatile uint32_t CFSR;                    
  volatile uint32_t HFSR;                    
  volatile uint32_t DFSR;                    
  volatile uint32_t MMFAR;                   
  volatile uint32_t BFAR;                    
  volatile uint32_t AFSR;                    
  volatile const  uint32_t PFR[2U];                 
  volatile const  uint32_t DFR;                     
  volatile const  uint32_t ADR;                     
  volatile const  uint32_t MMFR[4U];                
  volatile const  uint32_t ISAR[5U];                
        uint32_t RESERVED0[5U];
  volatile uint32_t CPACR;                   
} SCB_Type;

 





 










 

 







 



 






 














 



 





 






 






 



 





 







 



 
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const  uint32_t ICTR;                    
  volatile uint32_t ACTLR;                   
} SCnSCB_Type;

 

 




 







 



 
typedef struct
{
  volatile uint32_t CTRL;                    
  volatile uint32_t LOAD;                    
  volatile uint32_t VAL;                     
  volatile const  uint32_t CALIB;                   
} SysTick_Type;

 




 

 

 



 







 



 
typedef struct
{
  volatile  union
  {
    volatile  uint8_t    u8;                  
    volatile  uint16_t   u16;                 
    volatile  uint32_t   u32;                 
  }  PORT [32U];                          
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;                     
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;                     
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;                     
        uint32_t RESERVED3[29U];
  volatile  uint32_t IWR;                     
  volatile const  uint32_t IRR;                     
  volatile uint32_t IMCR;                    
        uint32_t RESERVED4[43U];
  volatile  uint32_t LAR;                     
  volatile const  uint32_t LSR;                     
        uint32_t RESERVED5[6U];
  volatile const  uint32_t PID4;                    
  volatile const  uint32_t PID5;                    
  volatile const  uint32_t PID6;                    
  volatile const  uint32_t PID7;                    
  volatile const  uint32_t PID0;                    
  volatile const  uint32_t PID1;                    
  volatile const  uint32_t PID2;                    
  volatile const  uint32_t PID3;                    
  volatile const  uint32_t CID0;                    
  volatile const  uint32_t CID1;                    
  volatile const  uint32_t CID2;                    
  volatile const  uint32_t CID3;                    
} ITM_Type;

 

 









 

 

 

 



   







 



 
typedef struct
{
  volatile uint32_t CTRL;                    
  volatile uint32_t CYCCNT;                  
  volatile uint32_t CPICNT;                  
  volatile uint32_t EXCCNT;                  
  volatile uint32_t SLEEPCNT;                
  volatile uint32_t LSUCNT;                  
  volatile uint32_t FOLDCNT;                 
  volatile const  uint32_t PCSR;                    
  volatile uint32_t COMP0;                   
  volatile uint32_t MASK0;                   
  volatile uint32_t FUNCTION0;               
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;                   
  volatile uint32_t MASK1;                   
  volatile uint32_t FUNCTION1;               
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;                   
  volatile uint32_t MASK2;                   
  volatile uint32_t FUNCTION2;               
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;                   
  volatile uint32_t MASK3;                   
  volatile uint32_t FUNCTION3;               
} DWT_Type;

 


















 

 

 

 

 

 

 









   







 



 
typedef struct
{
  volatile uint32_t SSPSR;                   
  volatile uint32_t CSPSR;                   
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;                    
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;                    
        uint32_t RESERVED2[131U];
  volatile const  uint32_t FFSR;                    
  volatile uint32_t FFCR;                    
  volatile const  uint32_t FSCR;                    
        uint32_t RESERVED3[759U];
  volatile const  uint32_t TRIGGER;                 
  volatile const  uint32_t FIFO0;                   
  volatile const  uint32_t ITATBCTR2;               
        uint32_t RESERVED4[1U];
  volatile const  uint32_t ITATBCTR0;               
  volatile const  uint32_t FIFO1;                   
  volatile uint32_t ITCTRL;                  
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;                
  volatile uint32_t CLAIMCLR;                
        uint32_t RESERVED7[8U];
  volatile const  uint32_t DEVID;                   
  volatile const  uint32_t DEVTYPE;                 
} TPI_Type;

 


 

 




 


 

 







 

 







 

 

 






 


   







 



 
typedef struct
{
  volatile const  uint32_t TYPE;                    
  volatile uint32_t CTRL;                    
  volatile uint32_t RNR;                     
  volatile uint32_t RBAR;                    
  volatile uint32_t RASR;                    
  volatile uint32_t RBAR_A1;                 
  volatile uint32_t RASR_A1;                 
  volatile uint32_t RBAR_A2;                 
  volatile uint32_t RASR_A2;                 
  volatile uint32_t RBAR_A3;                 
  volatile uint32_t RASR_A3;                 
} MPU_Type;


 



 



 

 



 










 







 



 
typedef struct
{
  volatile uint32_t DHCSR;                   
  volatile  uint32_t DCRSR;                   
  volatile uint32_t DCRDR;                   
  volatile uint32_t DEMCR;                   
} CoreDebug_Type;

 












 


 













 







 






 






 

 







 

 



 










 


 



 





 














 
static inline void __NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);              

  reg_value  =  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;                                                    
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));  
  reg_value  =  (reg_value                                   |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U) );                
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR =  reg_value;
}






 
static inline uint32_t __NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}







 
static inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}









 
static inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}







 
static inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __iar_builtin_DSB();
    __iar_builtin_ISB();
  }
}









 
static inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}







 
static inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}







 
static inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}









 
static inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}










 
static inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)]               = (uint8_t)((priority << (8U - 3U)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 3U)) & (uint32_t)0xFFUL);
  }
}










 
static inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)]               >> (8U - 3U)));
  }
  else
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] >> (8U - 3U)));
  }
}












 
static inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);    
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(3U)) ? (uint32_t)(3U) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits     = ((PriorityGroupTmp + (uint32_t)(3U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(3U));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority     & (uint32_t)((1UL << (SubPriorityBits    )) - 1UL)))
         );
}












 
static inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);    
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(3U)) ? (uint32_t)(3U) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits     = ((PriorityGroupTmp + (uint32_t)(3U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(3U));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority     = (Priority                   ) & (uint32_t)((1UL << (SubPriorityBits    )) - 1UL);
}










 
static inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  vectors[(int32_t)IRQn + 16] = vector;
}









 
static inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  return vectors[(int32_t)IRQn + 16];
}





 
static inline void __NVIC_SystemReset(void)
{
  __iar_builtin_DSB();                                                          
 
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR  = (uint32_t)((0x5FAUL << 16U)    |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U)    );          
  __iar_builtin_DSB();                                                           

  for(;;)                                                            
  {
    __iar_builtin_no_operation();
  }
}

 

 







 
















 
 
  #pragma system_include          
 







 












                          




 
typedef struct {
  uint32_t RBAR; 
  uint32_t RASR; 
} ARM_MPU_Region_t;
    


 
static inline void ARM_MPU_Enable(uint32_t MPU_Control)
{
  __iar_builtin_DSB();
  __iar_builtin_ISB();
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL = MPU_Control | (1UL );
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR |= (1UL << 16U);
}


 
static inline void ARM_MPU_Disable(void)
{
  __iar_builtin_DSB();
  __iar_builtin_ISB();
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR &= ~(1UL << 16U);
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL  &= ~(1UL );
}



 
static inline void ARM_MPU_ClrRegion(uint32_t rnr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = 0U;
}




    
static inline void ARM_MPU_SetRegion(uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}





    
static inline void ARM_MPU_SetRegionEx(uint32_t rnr, uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}





 
static inline void orderedCpy(volatile uint32_t* dst, const uint32_t* restrict src, uint32_t len)
{
  uint32_t i;
  for (i = 0U; i < len; ++i) 
  {
    dst[i] = src[i];
  }
}




 
static inline void ARM_MPU_Load(ARM_MPU_Region_t const* table, uint32_t cnt) 
{
  const uint32_t rowWordSize = sizeof(ARM_MPU_Region_t)/4U;
  while (cnt > 4U) {
    orderedCpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), 4U*rowWordSize);
    table += 4U;
    cnt -= 4U;
  }
  orderedCpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), cnt*rowWordSize);
}



 





 








 
static inline uint32_t SCB_GetFPUType(void)
{
    return 0U;            
}


 



 





 












 
static inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);                                                    
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD  = (uint32_t)(ticks - 1UL);                          
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 3U) - 1UL);  
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL   = 0UL;                                              
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL  = (1UL << 2U) |
                   (1UL << 1U)   |
                   (1UL );                          
  return (0UL);                                                      
}


 



 





 

extern volatile int32_t ITM_RxBuffer;                               









 
static inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&       
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL               ) != 0UL)   )      
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __iar_builtin_no_operation();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}







 
static inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;                            

  if (ITM_RxBuffer != ((int32_t)0x5AA55AA5U))
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = ((int32_t)0x5AA55AA5U);        
  }

  return (ch);
}







 
static inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == ((int32_t)0x5AA55AA5U))
  {
    return (0);                               
  }
  else
  {
    return (1);                               
  }
}

 






 



























 




 


 
 


 



 

 
typedef union {
  void (*pFunc)(void);
  void *topOfStack;
} tVectorEntry;



 

extern uint32_t SystemCoreClock;     

extern const tVectorEntry __vector_table[];



 

 
void Reset_Handler(void);            
void NMI_Handler(void);              
void HardFault_Handler(void);        
void MemManage_Handler(void);        
void BusFault_Handler(void);         
void UsageFault_Handler(void);       
void SVC_Handler(void);              
void DebugMon_Handler(void);         
void PendSV_Handler(void);           
void SysTick_Handler(void);          

void DMA_IRQHandler(void);           
void GPIO_EVEN_IRQHandler(void);     
void TIMER0_IRQHandler(void);        
void USART0_RX_IRQHandler(void);     
void USART0_TX_IRQHandler(void);     
void USB_IRQHandler(void);           
void ACMP0_IRQHandler(void);         
void ADC0_IRQHandler(void);          
void DAC0_IRQHandler(void);          
void I2C0_IRQHandler(void);          
void I2C1_IRQHandler(void);          
void GPIO_ODD_IRQHandler(void);      
void TIMER1_IRQHandler(void);        
void TIMER2_IRQHandler(void);        
void TIMER3_IRQHandler(void);        
void USART1_RX_IRQHandler(void);     
void USART1_TX_IRQHandler(void);     
void LESENSE_IRQHandler(void);       
void USART2_RX_IRQHandler(void);     
void USART2_TX_IRQHandler(void);     
void UART0_RX_IRQHandler(void);      
void UART0_TX_IRQHandler(void);      
void UART1_RX_IRQHandler(void);      
void UART1_TX_IRQHandler(void);      
void LEUART0_IRQHandler(void);       
void LEUART1_IRQHandler(void);       
void LETIMER0_IRQHandler(void);      
void PCNT0_IRQHandler(void);         
void PCNT1_IRQHandler(void);         
void PCNT2_IRQHandler(void);         
void RTC_IRQHandler(void);           
void BURTC_IRQHandler(void);         
void CMU_IRQHandler(void);           
void VCMP_IRQHandler(void);          
void LCD_IRQHandler(void);           
void MSC_IRQHandler(void);           
void AES_IRQHandler(void);           
void EBI_IRQHandler(void);           
void EMU_IRQHandler(void);           

uint32_t SystemCoreClockGet(void);
uint32_t SystemMaxCoreClockGet(void);

 












 
static inline void SystemCoreClockUpdate(void)
{
  (void)SystemCoreClockGet();
}

void SystemInit(void);
uint32_t SystemHFClockGet(void);
uint32_t SystemHFXOClockGet(void);
void SystemHFXOClockSet(uint32_t freq);
uint32_t SystemLFRCOClockGet(void);
uint32_t SystemULFRCOClockGet(void);
uint32_t SystemLFXOClockGet(void);
void SystemLFXOClockSet(uint32_t freq);

 
 



 

 



 

 



























 

#pragma system_include        

 


 
 

 
typedef struct {
  volatile uint32_t CTRL;  
} DMA_CH_TypeDef;

 

 



 
typedef struct {
  volatile const uint32_t  STATUS;           
  volatile uint32_t  CONFIG;           
  volatile uint32_t CTRLBASE;         
  volatile const uint32_t  ALTCTRLBASE;      
  volatile const uint32_t  CHWAITSTATUS;     
  volatile uint32_t  CHSWREQ;          
  volatile uint32_t CHUSEBURSTS;      
  volatile uint32_t  CHUSEBURSTC;      
  volatile uint32_t CHREQMASKS;       
  volatile uint32_t  CHREQMASKC;       
  volatile uint32_t CHENS;            
  volatile uint32_t  CHENC;            
  volatile uint32_t CHALTS;           
  volatile uint32_t  CHALTC;           
  volatile uint32_t CHPRIS;           
  volatile uint32_t  CHPRIC;           
  uint32_t       RESERVED0[3U];    
  volatile uint32_t ERRORC;           

  uint32_t       RESERVED1[880U];  
  volatile const uint32_t  CHREQSTATUS;      
  uint32_t       RESERVED2[1U];    
  volatile const uint32_t  CHSREQSTATUS;     

  uint32_t       RESERVED3[121U];  
  volatile const uint32_t  IF;               
  volatile uint32_t IFS;              
  volatile uint32_t IFC;              
  volatile uint32_t IEN;              
  volatile uint32_t CTRL;             
  volatile uint32_t RDS;              

  uint32_t       RESERVED4[2U];    
  volatile uint32_t LOOP0;            
  volatile uint32_t LOOP1;            
  uint32_t       RESERVED5[14U];   
  volatile uint32_t RECT0;            

  uint32_t       RESERVED6[39U];   
  DMA_CH_TypeDef CH[12U];          
} DMA_TypeDef;                      

 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;           
  volatile uint32_t CMD;            
  volatile const uint32_t  STATUS;         
  volatile uint32_t IEN;            
  volatile const uint32_t  IF;             
  volatile uint32_t IFS;            
  volatile uint32_t IFC;            
  volatile uint32_t DATA;           
  volatile uint32_t XORDATA;        
  uint32_t       RESERVED0[3U];  
  volatile uint32_t KEYLA;          
  volatile uint32_t KEYLB;          
  volatile uint32_t KEYLC;          
  volatile uint32_t KEYLD;          
  volatile uint32_t KEYHA;          
  volatile uint32_t KEYHB;          
  volatile uint32_t KEYHC;          
  volatile uint32_t KEYHD;          
} AES_TypeDef;                    

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;           
  volatile uint32_t READCTRL;       
  volatile uint32_t WRITECTRL;      
  volatile uint32_t WRITECMD;       
  volatile uint32_t ADDRB;          

  uint32_t       RESERVED0[1U];  
  volatile uint32_t WDATA;          
  volatile const uint32_t  STATUS;         

  uint32_t       RESERVED1[3U];  
  volatile const uint32_t  IF;             
  volatile uint32_t IFS;            
  volatile uint32_t IFC;            
  volatile uint32_t IEN;            
  volatile uint32_t LOCK;           
  volatile uint32_t CMD;            
  volatile const uint32_t  CACHEHITS;      
  volatile const uint32_t  CACHEMISSES;    
  uint32_t       RESERVED2[1U];  
  volatile uint32_t TIMEBASE;       
  volatile uint32_t MASSLOCK;       
} MSC_TypeDef;                    

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;           
  volatile uint32_t MEMCTRL;        
  volatile uint32_t LOCK;           

  uint32_t       RESERVED0[6U];  
  volatile uint32_t AUXCTRL;        

  uint32_t       RESERVED1[1U];  
  volatile uint32_t EM4CONF;        
  volatile uint32_t BUCTRL;         
  volatile uint32_t PWRCONF;        
  volatile uint32_t BUINACT;        
  volatile uint32_t BUACT;          
  volatile const uint32_t  STATUS;         
  volatile uint32_t ROUTE;          
  volatile const uint32_t  IF;             
  volatile uint32_t IFS;            
  volatile uint32_t IFC;            
  volatile uint32_t IEN;            
  volatile uint32_t BUBODBUVINCAL;  
  volatile uint32_t BUBODUNREGCAL;  
} EMU_TypeDef;                    

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;      
  volatile const uint32_t  RSTCAUSE;  
  volatile uint32_t  CMD;       
} RMU_TypeDef;               

 


 

 

 

 

 
 

 



 
typedef struct {
  volatile uint32_t CTRL;           
  volatile uint32_t HFCORECLKDIV;   
  volatile uint32_t HFPERCLKDIV;    
  volatile uint32_t HFRCOCTRL;      
  volatile uint32_t LFRCOCTRL;      
  volatile uint32_t AUXHFRCOCTRL;   
  volatile uint32_t CALCTRL;        
  volatile uint32_t CALCNT;         
  volatile uint32_t OSCENCMD;       
  volatile uint32_t CMD;            
  volatile uint32_t LFCLKSEL;       
  volatile const uint32_t  STATUS;         
  volatile const uint32_t  IF;             
  volatile uint32_t IFS;            
  volatile uint32_t IFC;            
  volatile uint32_t IEN;            
  volatile uint32_t HFCORECLKEN0;   
  volatile uint32_t HFPERCLKEN0;    
  uint32_t       RESERVED0[2U];  
  volatile const uint32_t  SYNCBUSY;       
  volatile uint32_t FREEZE;         
  volatile uint32_t LFACLKEN0;      
  uint32_t       RESERVED1[1U];  
  volatile uint32_t LFBCLKEN0;      

  uint32_t       RESERVED2[1U];  
  volatile uint32_t LFAPRESC0;      
  uint32_t       RESERVED3[1U];  
  volatile uint32_t LFBPRESC0;      
  uint32_t       RESERVED4[1U];  
  volatile uint32_t PCNTCTRL;       

  uint32_t       RESERVED5[1U];  
  volatile uint32_t ROUTE;          
  volatile uint32_t LOCK;           
} CMU_TypeDef;                    

 



























 

#pragma system_include        

 


 
 

 
typedef struct {
  volatile uint32_t TCONFA;  
  volatile uint32_t TCONFB;  
} LESENSE_ST_TypeDef;

 
 



























 

#pragma system_include        

 


 
 

 
typedef struct {
  volatile uint32_t DATA;  
} LESENSE_BUF_TypeDef;

 
 



























 

#pragma system_include        

 


 
 

 
typedef struct {
  volatile uint32_t TIMING;         
  volatile uint32_t INTERACT;       
  volatile uint32_t EVAL;           
  uint32_t       RESERVED0[1U];  
} LESENSE_CH_TypeDef;

 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t      CTRL;             
  volatile uint32_t      TIMCTRL;          
  volatile uint32_t      PERCTRL;          
  volatile uint32_t      DECCTRL;          
  volatile uint32_t      BIASCTRL;         
  volatile uint32_t      CMD;              
  volatile uint32_t      CHEN;             
  volatile const uint32_t       SCANRES;          
  volatile const uint32_t       STATUS;           
  volatile const uint32_t       PTR;              
  volatile const uint32_t       BUFDATA;          
  volatile const uint32_t       CURCH;            
  volatile uint32_t      DECSTATE;         
  volatile uint32_t      SENSORSTATE;      
  volatile uint32_t      IDLECONF;         
  volatile uint32_t      ALTEXCONF;        
  volatile const uint32_t       IF;               
  volatile uint32_t      IFC;              
  volatile uint32_t      IFS;              
  volatile uint32_t      IEN;              
  volatile const uint32_t       SYNCBUSY;         
  volatile uint32_t      ROUTE;            
  volatile uint32_t      POWERDOWN;        

  uint32_t            RESERVED0[105U];  
  LESENSE_ST_TypeDef  ST[16U];          

  LESENSE_BUF_TypeDef BUF[16U];         

  LESENSE_CH_TypeDef  CH[16U];          
} LESENSE_TypeDef;                       

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;      
  volatile uint32_t CNT;       
  volatile uint32_t COMP0;     
  volatile uint32_t COMP1;     
  volatile const uint32_t  IF;        
  volatile uint32_t IFS;       
  volatile uint32_t IFC;       
  volatile uint32_t IEN;       

  volatile uint32_t FREEZE;    
  volatile const uint32_t  SYNCBUSY;  
} RTC_TypeDef;               

 


 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;           
  volatile uint32_t CMD;            
  volatile const uint32_t  STATUS;         
  volatile uint32_t CNT;            
  volatile uint32_t COMP0;          
  volatile uint32_t COMP1;          
  volatile uint32_t REP0;           
  volatile uint32_t REP1;           
  volatile const uint32_t  IF;             
  volatile uint32_t IFS;            
  volatile uint32_t IFC;            
  volatile uint32_t IEN;            

  volatile uint32_t FREEZE;         
  volatile const uint32_t  SYNCBUSY;       

  uint32_t       RESERVED0[2U];  
  volatile uint32_t ROUTE;          
} LETIMER_TypeDef;                

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;        
  volatile uint32_t FRAME;       
  volatile uint32_t TRIGCTRL;    
  volatile uint32_t CMD;         
  volatile const uint32_t  STATUS;      
  volatile uint32_t CLKDIV;      
  volatile const uint32_t  RXDATAX;     
  volatile const uint32_t  RXDATA;      
  volatile const uint32_t  RXDOUBLEX;   
  volatile const uint32_t  RXDOUBLE;    
  volatile const uint32_t  RXDATAXP;    
  volatile const uint32_t  RXDOUBLEXP;  
  volatile uint32_t TXDATAX;     
  volatile uint32_t TXDATA;      
  volatile uint32_t TXDOUBLEX;   
  volatile uint32_t TXDOUBLE;    
  volatile const uint32_t  IF;          
  volatile uint32_t IFS;         
  volatile uint32_t IFC;         
  volatile uint32_t IEN;         
  volatile uint32_t IRCTRL;      
  volatile uint32_t ROUTE;       
  volatile uint32_t INPUT;       
  volatile uint32_t I2SCTRL;     
} USART_TypeDef;               

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 

 
typedef struct {
  volatile uint32_t CTRL;  
  volatile uint32_t CCV;   
  volatile const uint32_t  CCVP;  
  volatile uint32_t CCVB;  
} TIMER_CC_TypeDef;

 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t   CTRL;           
  volatile uint32_t   CMD;            
  volatile const uint32_t    STATUS;         
  volatile uint32_t   IEN;            
  volatile const uint32_t    IF;             
  volatile uint32_t   IFS;            
  volatile uint32_t   IFC;            
  volatile uint32_t   TOP;            
  volatile uint32_t   TOPB;           
  volatile uint32_t   CNT;            
  volatile uint32_t   ROUTE;          

  uint32_t         RESERVED0[1U];  
  TIMER_CC_TypeDef CC[3U];         

  uint32_t         RESERVED1[4U];  
  volatile uint32_t   DTCTRL;         
  volatile uint32_t   DTTIME;         
  volatile uint32_t   DTFC;           
  volatile uint32_t   DTOGEN;         
  volatile const uint32_t    DTFAULT;        
  volatile uint32_t    DTFAULTC;       
  volatile uint32_t   DTLOCK;         
} TIMER_TypeDef;                    

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;      
  volatile uint32_t INPUTSEL;  
  volatile const uint32_t  STATUS;    
  volatile uint32_t IEN;       
  volatile const uint32_t  IF;        
  volatile uint32_t IFS;       
  volatile uint32_t IFC;       
  volatile uint32_t ROUTE;     
} ACMP_TypeDef;              

 


 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;       
  volatile uint32_t CMD;        
  volatile const uint32_t  STATE;      
  volatile const uint32_t  STATUS;     
  volatile uint32_t CLKDIV;     
  volatile uint32_t SADDR;      
  volatile uint32_t SADDRMASK;  
  volatile const uint32_t  RXDATA;     
  volatile const uint32_t  RXDATAP;    
  volatile uint32_t TXDATA;     
  volatile const uint32_t  IF;         
  volatile uint32_t IFS;        
  volatile uint32_t IFC;        
  volatile uint32_t IEN;        
  volatile uint32_t ROUTE;      
} I2C_TypeDef;                

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 

 
typedef struct {
  volatile uint32_t CTRL;      
  volatile uint32_t MODEL;     
  volatile uint32_t MODEH;     
  volatile uint32_t DOUT;      
  volatile uint32_t  DOUTSET;   
  volatile uint32_t  DOUTCLR;   
  volatile uint32_t  DOUTTGL;   
  volatile const uint32_t  DIN;       
  volatile uint32_t PINLOCKN;  
} GPIO_P_TypeDef;

 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  GPIO_P_TypeDef P[6U];           

  uint32_t       RESERVED0[10U];  
  volatile uint32_t EXTIPSELL;       
  volatile uint32_t EXTIPSELH;       
  volatile uint32_t EXTIRISE;        
  volatile uint32_t EXTIFALL;        
  volatile uint32_t IEN;             
  volatile const uint32_t  IF;              
  volatile uint32_t IFS;             
  volatile uint32_t IFC;             

  volatile uint32_t ROUTE;           
  volatile uint32_t INSENSE;         
  volatile uint32_t LOCK;            
  volatile uint32_t CTRL;            
  volatile uint32_t CMD;             
  volatile uint32_t EM4WUEN;         
  volatile uint32_t EM4WUPOL;        
  volatile const uint32_t  EM4WUCAUSE;      
} GPIO_TypeDef;                    

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;      
  volatile uint32_t INPUTSEL;  
  volatile const uint32_t  STATUS;    
  volatile uint32_t IEN;       
  volatile const uint32_t  IF;        
  volatile uint32_t IFS;       
  volatile uint32_t IFC;       
} VCMP_TypeDef;              

 


 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 

 
typedef struct {
  volatile uint32_t CTRL;  
} PRS_CH_TypeDef;

 

 



 
typedef struct {
  volatile uint32_t SWPULSE;        
  volatile uint32_t SWLEVEL;        
  volatile uint32_t ROUTE;          

  uint32_t       RESERVED0[1U];  
  PRS_CH_TypeDef CH[12U];        
} PRS_TypeDef;                    

 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;            
  volatile uint32_t CMD;             
  volatile const uint32_t  STATUS;          
  volatile uint32_t CLKDIV;          
  volatile uint32_t STARTFRAME;      
  volatile uint32_t SIGFRAME;        
  volatile const uint32_t  RXDATAX;         
  volatile const uint32_t  RXDATA;          
  volatile const uint32_t  RXDATAXP;        
  volatile uint32_t TXDATAX;         
  volatile uint32_t TXDATA;          
  volatile const uint32_t  IF;              
  volatile uint32_t IFS;             
  volatile uint32_t IFC;             
  volatile uint32_t IEN;             
  volatile uint32_t PULSECTRL;       

  volatile uint32_t FREEZE;          
  volatile const uint32_t  SYNCBUSY;        

  uint32_t       RESERVED0[3U];   
  volatile uint32_t ROUTE;           
  uint32_t       RESERVED1[21U];  
  volatile uint32_t INPUT;           
} LEUART_TypeDef;                  

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;           
  volatile uint32_t CMD;            
  volatile const uint32_t  STATUS;         
  volatile const uint32_t  CNT;            
  volatile const uint32_t  TOP;            
  volatile uint32_t TOPB;           
  volatile const uint32_t  IF;             
  volatile uint32_t IFS;            
  volatile uint32_t IFC;            
  volatile uint32_t IEN;            
  volatile uint32_t ROUTE;          

  volatile uint32_t FREEZE;         
  volatile const uint32_t  SYNCBUSY;       

  uint32_t       RESERVED0[1U];  
  volatile uint32_t AUXCNT;         
  volatile uint32_t INPUT;          
} PCNT_TypeDef;                   

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;           
  volatile uint32_t CMD;            
  volatile const uint32_t  STATUS;         
  volatile uint32_t SINGLECTRL;     
  volatile uint32_t SCANCTRL;       
  volatile uint32_t IEN;            
  volatile const uint32_t  IF;             
  volatile uint32_t IFS;            
  volatile uint32_t IFC;            
  volatile const uint32_t  SINGLEDATA;     
  volatile const uint32_t  SCANDATA;       
  volatile const uint32_t  SINGLEDATAP;    
  volatile const uint32_t  SCANDATAP;      
  volatile uint32_t CAL;            

  uint32_t       RESERVED0[1U];  
  volatile uint32_t BIASPROG;       
} ADC_TypeDef;                    

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;           
  volatile const uint32_t  STATUS;         
  volatile uint32_t CH0CTRL;        
  volatile uint32_t CH1CTRL;        
  volatile uint32_t IEN;            
  volatile const uint32_t  IF;             
  volatile uint32_t IFS;            
  volatile uint32_t IFC;            
  volatile uint32_t CH0DATA;        
  volatile uint32_t CH1DATA;        
  volatile uint32_t COMBDATA;       
  volatile uint32_t CAL;            
  volatile uint32_t BIASPROG;       
  uint32_t       RESERVED0[8U];  
  volatile uint32_t OPACTRL;        
  volatile uint32_t OPAOFFSET;      
  volatile uint32_t OPA0MUX;        
  volatile uint32_t OPA1MUX;        
  volatile uint32_t OPA2MUX;        
} DAC_TypeDef;                    

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 

 
typedef struct {
  volatile uint32_t REG;  
} BURTC_RET_TypeDef;

 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t    CTRL;            
  volatile uint32_t    LPMODE;          
  volatile const uint32_t     CNT;             
  volatile uint32_t    COMP0;           
  volatile const uint32_t     TIMESTAMP;       
  volatile uint32_t    LFXOFDET;        
  volatile const uint32_t     STATUS;          
  volatile uint32_t    CMD;             
  volatile uint32_t    POWERDOWN;       
  volatile uint32_t    LOCK;            
  volatile const uint32_t     IF;              
  volatile uint32_t    IFS;             
  volatile uint32_t    IFC;             
  volatile uint32_t    IEN;             

  volatile uint32_t    FREEZE;          
  volatile const uint32_t     SYNCBUSY;        

  uint32_t          RESERVED0[48U];  
  BURTC_RET_TypeDef RET[128U];       
} BURTC_TypeDef;                      

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t CTRL;      
  volatile uint32_t CMD;       

  volatile const uint32_t  SYNCBUSY;  
} WDOG_TypeDef;              

 


 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile uint32_t ETMCR;             
  volatile const uint32_t  ETMCCR;            
  volatile uint32_t ETMTRIGGER;        
  uint32_t       RESERVED0[1U];     
  volatile uint32_t ETMSR;             
  volatile const uint32_t  ETMSCR;            
  uint32_t       RESERVED1[2U];     
  volatile uint32_t ETMTEEVR;          
  volatile uint32_t ETMTECR1;          
  uint32_t       RESERVED2[1U];     
  volatile uint32_t ETMFFLR;           
  uint32_t       RESERVED3[68U];    
  volatile uint32_t ETMCNTRLDVR1;      
  uint32_t       RESERVED4[39U];    
  volatile uint32_t ETMSYNCFR;         
  volatile const uint32_t  ETMIDR;            
  volatile const uint32_t  ETMCCER;           
  uint32_t       RESERVED5[1U];     
  volatile uint32_t ETMTESSEICR;       
  uint32_t       RESERVED6[1U];     
  volatile uint32_t ETMTSEVR;          
  uint32_t       RESERVED7[1U];     
  volatile uint32_t ETMTRACEIDR;       
  uint32_t       RESERVED8[1U];     
  volatile const uint32_t  ETMIDR2;           
  uint32_t       RESERVED9[66U];    
  volatile const uint32_t  ETMPDSR;           
  uint32_t       RESERVED10[754U];  
  volatile uint32_t ETMISCIN;          
  uint32_t       RESERVED11[1U];    
  volatile uint32_t  ITTRIGOUT;         
  uint32_t       RESERVED12[1U];    
  volatile const uint32_t  ETMITATBCTR2;      
  uint32_t       RESERVED13[1U];    
  volatile uint32_t  ETMITATBCTR0;      
  uint32_t       RESERVED14[1U];    
  volatile uint32_t ETMITCTRL;         
  uint32_t       RESERVED15[39U];   
  volatile uint32_t ETMCLAIMSET;       
  volatile uint32_t ETMCLAIMCLR;       
  uint32_t       RESERVED16[2U];    
  volatile uint32_t ETMLAR;            
  volatile const uint32_t  ETMLSR;            
  volatile const uint32_t  ETMAUTHSTATUS;     
  uint32_t       RESERVED17[4U];    
  volatile const uint32_t  ETMDEVTYPE;        
  volatile const uint32_t  ETMPIDR4;          
  volatile uint32_t  ETMPIDR5;          
  volatile uint32_t  ETMPIDR6;          
  volatile uint32_t  ETMPIDR7;          
  volatile const uint32_t  ETMPIDR0;          
  volatile const uint32_t  ETMPIDR1;          
  volatile const uint32_t  ETMPIDR2;          
  volatile const uint32_t  ETMPIDR3;          
  volatile const uint32_t  ETMCIDR0;          
  volatile const uint32_t  ETMCIDR1;          
  volatile const uint32_t  ETMCIDR2;          
  volatile const uint32_t  ETMCIDR3;          
} ETM_TypeDef;                       

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
 
 



























 

#pragma system_include        

 


 
 


 
typedef struct {
   
   
  volatile void * volatile SRCEND;    
  volatile void * volatile DSTEND;    
  volatile uint32_t     CTRL;      
  volatile uint32_t     USER;      
} DMA_DESCRIPTOR_TypeDef;       

 
 



























 

#pragma system_include        

 


 
 


 
typedef struct {
  volatile const uint32_t CAL;            
  volatile const uint32_t ADC0CAL0;       
  volatile const uint32_t ADC0CAL1;       
  volatile const uint32_t ADC0CAL2;       
  uint32_t      RESERVED0[2U];  
  volatile const uint32_t DAC0CAL0;       
  volatile const uint32_t DAC0CAL1;       
  volatile const uint32_t DAC0CAL2;       
  volatile const uint32_t AUXHFRCOCAL0;   
  volatile const uint32_t AUXHFRCOCAL1;   
  volatile const uint32_t HFRCOCAL0;      
  volatile const uint32_t HFRCOCAL1;      
  volatile const uint32_t MEMINFO;        
  uint32_t      RESERVED2[2U];  
  volatile const uint32_t UNIQUEL;        
  volatile const uint32_t UNIQUEH;        
  volatile const uint32_t MSIZE;          
  volatile const uint32_t PART;           
} DEVINFO_TypeDef;              

 


 
 
 
 

 
 
 



























 

#pragma system_include        

 


 
 



 
typedef struct {
  volatile const uint32_t PID4;  
  volatile const uint32_t PID5;  
  volatile const uint32_t PID6;  
  volatile const uint32_t PID7;  
  volatile const uint32_t PID0;  
  volatile const uint32_t PID1;  
  volatile const uint32_t PID2;  
  volatile const uint32_t PID3;  
  volatile const uint32_t CID0;  
} ROMTABLE_TypeDef;    

 


 
 

 
 
 



























 

#pragma system_include        

 


 
 


 

typedef struct {
  volatile const uint32_t ADDRESS;  
  volatile const uint32_t VALUE;    
} CALIBRATE_TypeDef;      

 

 

 


 


 

 


 


 

 


 

 



 

 

 



























 

#pragma system_include        

 


 

 


 

 
 
 



























 

#pragma system_include        

 


 

 


 

 
 

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 


 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 


 

 

 

 

 

 

 


 

 

 

 


 

 



























 

#pragma system_include        

 


 
 


 


 
 
 



























 

#pragma system_include        

 


 
 


 


 
 

 

 











 

 

 




 












 



__ramfunc void USART_printHex(uint32_t integer);
__ramfunc void USART_txByte(uint8_t data);
__ramfunc uint8_t USART_rxByte(void);
__ramfunc void USART_printString(uint8_t *string);
void USART_init(uint32_t clkdiv);

 













 





 



 



 



 


 



 




 






 



 



 
static inline void CONFIG_DebugGpioSetup(void)
{
  
  ((GPIO_TypeDef *) (0x40006000UL))->P[1].DOUT = (1 << 9);
  ((GPIO_TypeDef *) (0x40006000UL))->P[1].MODEH = (0x00000004UL << 4) | (0x00000001UL << 8);
}

static inline void CONFIG_UsartGpioSetup(void)
{
  
  
  
  
  
  ((GPIO_TypeDef *) (0x40006000UL))->P[4].DOUT = (1 << 10);
  ((GPIO_TypeDef *) (0x40006000UL))->P[4].MODEH = (0x00000004UL << 8) | (0x00000001UL << 12);
}


 





 
__ramfunc void USART_printHex(uint32_t integer)
{
  uint8_t c;
  int i, digit;

  for (i = 0; i <= 7; i++)
  {
    digit = integer >> 28;
    c = digit + 0x30;
    if (digit >= 10)
    {
      c += 7;
    }
    USART_txByte(c);
    integer <<= 4;
  }
}

 

 
__ramfunc uint8_t USART_rxByte(void)
{
  uint32_t timer = 1000000;
  while (!(((USART_TypeDef *) (0x4000C000UL))->STATUS & (0x1UL << 7)) && --timer ) ;
  if (timer > 0)
  {
    return((uint8_t)(((USART_TypeDef *) (0x4000C000UL))->RXDATA & 0xFF));
  }
  else
  {
    return 0;
  }
}


 

 
__ramfunc void USART_txByte(uint8_t data)
{
   
  while (!(((USART_TypeDef *) (0x4000C000UL))->STATUS & (0x1UL << 6))) ;

  ((USART_TypeDef *) (0x4000C000UL))->TXDATA = (uint32_t) data;
}

 

 
__ramfunc void USART_printString(uint8_t *string)
{
  while (*string != 0)
  {
    USART_txByte(*string++);
  }
}

 




 
void USART_init(uint32_t clkdiv)
{
   
  
 

   
  ((USART_TypeDef *) (0x4000C000UL))->CLKDIV = clkdiv;

   
  ((USART_TypeDef *) (0x4000C000UL))->ROUTE = (0x00000000UL << 8)
                            | (0x1UL << 0) | (0x1UL << 1);


   
  ((USART_TypeDef *) (0x4000C000UL))->CMD = (0x1UL << 11) | (0x1UL << 10)
                          | (0x1UL << 0) | (0x1UL << 2);
}
