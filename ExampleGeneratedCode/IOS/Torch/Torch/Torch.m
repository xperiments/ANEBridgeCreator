			//
			//  Torch.m
			//  Torch
			//
			//  Created by Pedro Casaubon on 20/02/2013.
			//  Copyright (c)2013 Pedro Casaubon. All rights reserved.
			//
			
			#import "FlashRuntimeExtensions.h"
			#import "TorchEventMessages.h"
			
			#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
			#define DISPATCH_STATUS_EVENT(extensionContext, code, status) FREDispatchStatusEventAsync((extensionContext), (uint8_t*)code, (uint8_t*)status)
			#define MAP_FUNCTION(fn, data) { (const uint8_t*)(#fn), (data), &(fn) }
			
			#define ASSERT_ARGC_IS(fn_name, required)																	\
			if(argc != (required))																						\
			{																											\
				DISPATCH_INTERNAL_ERROR(context, #fn_name ": Wrong number of arguments. Expected exactly " #required);	\
				return NULL;																							\
			}
			#define ASSERT_ARGC_AT_LEAST(fn_name, required)																\
			if(argc < (required))																						\
			{																											\
				DISPATCH_INTERNAL_ERROR(context, #fn_name ": Wrong number of arguments. Expected at least " #required);	\
				return NULL;																							\
			}
			
			/****************************************************************************************
			 *																						*
			 *	PROPERTIES GETTERS/SETTERS															*
			 *																						*
			 ****************************************************************************************/
			
			 
			
			
			
			/****************************************************************************************
			 *																						*
			 *	METHODS BRIDGED																		*
			 *																						*
			 ****************************************************************************************/
			
			/****************************************************************************************
			 * @method:loadHtmlPage( url:String,dispatchEventOnComplete:Boolean):void
			 ****************************************************************************************/
			DEFINE_ANE_FUNCTION( loadHtmlPage )
			{
				
				//  url:String = argument[0];
			
				uint32_t urlLength;
				const uint8_t *url_CString;
				FREGetObjectAsUTF8(argv[0], &urlLength, &url_CString);
				NSString *url = [NSString stringWithUTF8String:(char*)url_CString];
				
			
				//  dispatchEventOnComplete:Boolean = argument[1];
			
				uint32_t dispatchEventOnComplete_C;
				if( FREGetObjectAsBool(argv[1], &dispatchEventOnComplete_C) != FRE_OK ) return NULL;
				
			
				return NULL;
			}
			
			
			/****************************************************************************************
			 * @method:setTorchEnabled( mode:Boolean):Boolean
			 ****************************************************************************************/
			DEFINE_ANE_FUNCTION( setTorchEnabled )
			{
				
				//  mode:Boolean = argument[0];
			
				uint32_t mode_C;
				if( FREGetObjectAsBool(argv[0], &mode_C) != FRE_OK ) return NULL;
				
			
				//  return->as3 ( resultFromBoolean as Boolean );
				uint32_t resultFromBoolean= 0;
				FREObject ane_resultFromBoolean= nil;
				FRENewObjectFromBool(resultFromBoolean, &ane_resultFromBoolean);
				
				return ane_resultFromBoolean;
			
			}
			
			
			/****************************************************************************************
			 *																						*
			 *	EXTENSION & CONTEXT																	*
			 *																						*
			 ****************************************************************************************/
			
			void TorchContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet )
			{
				static FRENamedFunction functionMap[] = {
					// METHODS
					MAP_FUNCTION( loadHtmlPage, NULL ),
					MAP_FUNCTION( setTorchEnabled, NULL )
				};
				*numFunctionsToSet = sizeof( functionMap ) / sizeof( FRENamedFunction );
				*functionsToSet = functionMap;
			}
			void TorchContextFinalizer( FREContext ctx )
			{
				NSLog(@"Entering TorchContextFinalizer()");
				NSLog(@"Exiting TorchContextFinalizer()");
				return;
			}
			void TorchExtensionInitializer( void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet ) 
			{ 
				NSLog(@"Entering TorchExtensionInitializer()");
				extDataToSet = NULL;  // This example does not use any extension data.
				*ctxInitializerToSet = &TorchContextInitializer;
				*ctxFinalizerToSet = &TorchContextFinalizer;
			}
			void TorchExtensionFinalizer()
			{
				NSLog(@"Entering TorchExtensionFinalizer()");
				return;
			}
			