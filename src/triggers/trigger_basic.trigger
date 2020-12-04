trigger trigger_basic on Opportunity (Before Insert, Before Update) {
for(opportunity a:trigger.new)
{
if(a.Amount < 501)
a.adderror('The Amount value should be greater then 500');
}
}