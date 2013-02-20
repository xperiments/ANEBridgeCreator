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