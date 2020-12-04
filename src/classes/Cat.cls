public class Cat 
{
    private string name; //private variable
    private integer size;
    
    public Cat(string n,integer s)
    {
        name=n;
        size=s;
    }
    
    public Cat()
    {
        name='Tina';
        size=10;
    }
        
        
    public void display()
    {
        system.debug('Name of the cat is '+name);
        system.debug('Size of the cat is '+size);
    }

}