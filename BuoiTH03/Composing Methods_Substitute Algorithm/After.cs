using System;
using System.Collections.Generic;

namespace ComposingMethods_SubstituteAlgorithm
{
    public class After
    {
        string FoundPerson(string[] people)
        {
            List<string> candidates = new List<string>() { "Don", "John", "Kent" };

            for (int i = 0; i < people.Length; i++)
            {
                if (candidates.Contains(people[i]))
                {
                    return people[i];
                }
            }

            return String.Empty;
        }
    }
}
