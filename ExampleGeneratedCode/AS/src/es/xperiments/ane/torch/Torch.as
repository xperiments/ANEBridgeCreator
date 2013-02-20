			//
			//  Torch.as
			//
			//  Created by Pedro Casaubon on 20/02/2013.
			//  Copyright (c)2013 Pedro Casaubon. All rights reserved.
			//
			package es.xperiments.ane.torch
			{
				import flash.events.EventDispatcher;
				import flash.events.StatusEvent;
				import flash.external.ExtensionContext;
				
				
				public class Torch extends EventDispatcher
				{
					/**
					 * Declare static context
					 */
					private static var __context:ExtensionContext = null;
					
					/**
					 * Declare private accesors vars
					 */
					
					/**
					 * Torch Constructor
					 */
					public function Torch( )
					{
						if ( !__context )
						{
							__context = ExtensionContext.createExtensionContext("es.xperiments.ane.torch.Torch","es.xperiments.ane.torch.Torch");
						}
					}
					
					/**
					* @param url:String
					* @param dispatchEventOnComplete:Boolean
					* @return void
					*/
					public function loadHtmlPage( url:String, dispatchEventOnComplete:Boolean):void
					{
						__context.call( 'loadHtmlPage',url, dispatchEventOnComplete) ;
					};
					
					/**
					* @param mode:Boolean
					* @return Boolean
					*/
					public function setTorchEnabled( mode:Boolean):Boolean
					{
						return	__context.call( 'setTorchEnabled',mode) as Boolean;
					};
					
					
					
					/**
					 * GETTERS/SETTERS
					 */
					
					
					/**
					 * Check if the extension is supported
					 * @return Boolean
					 */
					public static function get isSupported():Boolean
					{
						return true;
					}
					
					/**
					 * Dispose the Torch extension
					 */
					public function dispose():void
					{
						if( __context.hasEventListener(StatusEvent.STATUS) ) __context.removeEventListener(StatusEvent.STATUS,onContextStatusEvent);
						__context.dispose();
						__context = null;
					}
					
					/**
					 * Main Native Event Listener
					 */
					private function onContextStatusEvent( e:StatusEvent ):void
					{
						switch( e.code )
						{
							switch "complete":
							
							break;
							default:
							
							break;
						}
					}
				}
				
			}
		