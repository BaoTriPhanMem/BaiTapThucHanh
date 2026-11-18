namespace OrganizingData_ReplaceMagicNumberwithSymbolicConstant
{
    public class After
    {
        const double GRAVITATIONAL_CONSTANT = 9.81;

        double PotentialEnergy(double mass, double height)
        {
            return mass * height * GRAVITATIONAL_CONSTANT;
        }
    }
}
