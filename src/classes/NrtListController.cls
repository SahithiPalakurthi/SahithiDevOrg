public class NrtListController {
	public NrtListController(ApexPages.StandardController controller) {}
	public String getCaseNrt(){
        	return System.currentPagereference().getParameters().get('caseID');
	}
}