public class NewCaseListController {
    public List<Case> getNewCases() {
    
   List<Case> results=[select id,CaseNumber from Case where Case.Status='New'];
    return results;
}

}