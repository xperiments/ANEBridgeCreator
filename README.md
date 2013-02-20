# ANEBridgeCreator

A little tool to simplify the startup of a ANE project.

It lets you generate a "startup iOS ANE" project from a "bridge as3 class".

## Usage

#### 1. Pseudo Interface Class Creation
Imagine you need an ANE that lets you start/stop the iphone torch, load a html page in a webview and dispatch a complete event when page is loaded. To do this you need to create a simple as3 class like:

    package es.xperiments.ane.torch
    {
        [ANEConfig(autor="Pedro Casaubon", processAllMethods="true")]
        [ANEvent(name="complete")]
        public class Torch
    	{
    		[ANEmbed(arguments="mode")]
    		public function setTorchEnabled( mode:Boolean ):Boolean
    		{
    			return true;
    		}
            
        	[ANEmbed(arguments="url dispatchEventOnComplete")]
    		public function loadHtmlPage( url:String, dispatchEventOnComplete:Boolean ):void{}
            
    	}
    }

#### 2. Compile your "bridge" class to a swf

> You need to compile your class by preserving the metadata tags

#### 3. Open [ANEBridgeCreator.swf](http://www.xperiments.es/ANEBridgeCreator/ANEBridgeCreator.html)

#### 4. Select your generated swf file

#### 5. Set the full class package class name.(ie: es.xperiments.ane.torch.Torch )

#### 6. Select the target AIR SDK

#### 7. Save the resulting zip file and decompress it

#### 8. Locate ANTBUILD/local.properties and change the FLEX_HOME path

#### 9. Start coding!!!

#### 10. Use the build script inside ANTBUILD to generate your ANE

## Metadata

ANEBridgeCreator uses metadata to know some aspects of your interface

##### [ANEConfig]
    It has 2 parameters
        autor               ==> The name you like to be shown at yoour generated code
        processAllMethods   ==> By default ANEBridgeCreator will only generate code for
                                the methods that have the [ANEmbed]
                                Set it to true to process all the methods of the class

##### [ANEvent(name="xxx")]
    This metadata lets you define the name of the events your ANE will use.
    In the obj-c side, include the generated {{classname}}EventMessages.h and dispatch
    the events with the provided "util" DISPATCH_STATUS_EVENT as:
        
        DISPATCH_STATUS_EVENT( context, nameoftheevent, eventdata );
        
##### [ANEmbed(arguments="argName1 argName2")]       
    Use this metadata tag to specify wich methods to generate when processAllMethods
    of ANEConfig tag is set to false(default).
    
    You can also "name" your method params to be the same in as3 and in obj-c.
    If you have by a example a method:
        [ANEmbed(arguments="name password")] 
        public function login( name:String, password:String )
    It will generate the code with the "name" or "password" param names, otherwise
    it will name your params "stringArg0" and "stringArg1"
    