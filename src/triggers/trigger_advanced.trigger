trigger trigger_advanced on Opportunity (After Insert) {
contact c = new contact();
for(opportunity o:trigger.new)
{
c.AccountID = o.AccountID;
c.firstname = 'Carol';
c.lastname = 'Stevenberg';
insert c;
}
}