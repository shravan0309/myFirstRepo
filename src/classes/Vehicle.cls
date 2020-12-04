public virtual class Vehicle //to extend the class must be virtual.
{
    public void model()
    {
        system.debug('Model method of vehicle class');
    }
    
    public virtual void speed()
    {
        system.debug('speed of the vehicle depends on type of the vehicle');
    }

}