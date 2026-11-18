namespace OrganizingData_ReplaceArraywithObject
{
    public class After
    {
        class Performance
        {
            private string name;
            private string wins;

            public void SetName(string name) { this.name = name; }
            public void SetWins(string wins) { this.wins = wins; }
        }

        void Example()
        {
            Performance row = new Performance();
            row.SetName("Liverpool");
            row.SetWins("15");
        }
    }
}
