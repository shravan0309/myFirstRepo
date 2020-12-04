@isTest //annotate as test//
private class calculateTest 
{
@isTest //annotate both class and method as tests//
private static void testsum()
{
    Integer a,b,c;
    a=3; b=4;
    c = a + b;
    system.assertEquals (7, c); //assert equals tests the annotated test classes and the values (7, c) in the brackets are the expected and test values//
}
    
}