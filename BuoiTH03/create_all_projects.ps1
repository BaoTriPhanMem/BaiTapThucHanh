# PowerShell Script to create 30 Refactoring Pattern Projects
# This script creates all projects with Before.cs, After.cs, and Real.cs

$solutionDir = "H:\HK1_26_27\HP_ThietKeBaoTriPM\BTH03"
$solutionFile = Join-Path $solutionDir "BTH03.sln"

Set-Location $solutionDir

# Define all 30 refactoring patterns with exact names as per requirements
$refactoringPatterns = @(
    # A. Composing Methods (7 projects)
    @{
        ProjectName = "Composing Methods_Extract Method"
        Category = "Composing Methods"
        Pattern = "Extract Method"
    },
    @{
        ProjectName = "Composing Methods_Inline Method"
        Category = "Composing Methods"
        Pattern = "Inline Method"
    },
    @{
        ProjectName = "Composing Methods_Extract Variable"
        Category = "Composing Methods"
        Pattern = "Extract Variable"
    },
    @{
        ProjectName = "Composing Methods_Inline Temp"
        Category = "Composing Methods"
        Pattern = "Inline Temp"
    },
    @{
        ProjectName = "Composing Methods_Replace Temp with Query"
        Category = "Composing Methods"
        Pattern = "Replace Temp with Query"
    },
    @{
        ProjectName = "Composing Methods_Split Temporary Variable"
        Category = "Composing Methods"
        Pattern = "Split Temporary Variable"
    },
    @{
        ProjectName = "Composing Methods_Remove Assignments to Parameters"
        Category = "Composing Methods"
        Pattern = "Remove Assignments to Parameters"
    },
    # B. Moving Features (4 projects)
    @{
        ProjectName = "Moving Features_Move Method"
        Category = "Moving Features"
        Pattern = "Move Method"
    },
    @{
        ProjectName = "Moving Features_Move Field"
        Category = "Moving Features"
        Pattern = "Move Field"
    },
    @{
        ProjectName = "Moving Features_Extract Class"
        Category = "Moving Features"
        Pattern = "Extract Class"
    },
    @{
        ProjectName = "Moving Features_Inline Class"
        Category = "Moving Features"
        Pattern = "Inline Class"
    },
    # C. Organizing Data (5 projects)
    @{
        ProjectName = "Organizing Data_Self Encapsulate Field"
        Category = "Organizing Data"
        Pattern = "Self Encapsulate Field"
    },
    @{
        ProjectName = "Organizing Data_Replace Magic Number with Symbolic Constant"
        Category = "Organizing Data"
        Pattern = "Replace Magic Number with Symbolic Constant"
    },
    @{
        ProjectName = "Organizing Data_Encapsulate Field"
        Category = "Organizing Data"
        Pattern = "Encapsulate Field"
    },
    @{
        ProjectName = "Organizing Data_Encapsulate Collection"
        Category = "Organizing Data"
        Pattern = "Encapsulate Collection"
    },
    @{
        ProjectName = "Organizing Data_Replace Type Code with Class"
        Category = "Organizing Data"
        Pattern = "Replace Type Code with Class"
    },
    # D. Simplifying Conditionals (5 projects)
    @{
        ProjectName = "Simplifying Conditionals_Decompose Conditional"
        Category = "Simplifying Conditionals"
        Pattern = "Decompose Conditional"
    },
    @{
        ProjectName = "Simplifying Conditionals_Consolidate Conditional Expression"
        Category = "Simplifying Conditionals"
        Pattern = "Consolidate Conditional Expression"
    },
    @{
        ProjectName = "Simplifying Conditionals_Guard Clauses"
        Category = "Simplifying Conditionals"
        Pattern = "Guard Clauses"
    },
    @{
        ProjectName = "Simplifying Conditionals_Replace Conditional with Polymorphism"
        Category = "Simplifying Conditionals"
        Pattern = "Replace Conditional with Polymorphism"
    },
    @{
        ProjectName = "Simplifying Conditionals_Introduce Null Object"
        Category = "Simplifying Conditionals"
        Pattern = "Introduce Null Object"
    },
    # E. Simplifying Method Calls (5 projects)
    @{
        ProjectName = "Simplifying Method Calls_Rename Method"
        Category = "Simplifying Method Calls"
        Pattern = "Rename Method"
    },
    @{
        ProjectName = "Simplifying Method Calls_Add Parameter"
        Category = "Simplifying Method Calls"
        Pattern = "Add Parameter"
    },
    @{
        ProjectName = "Simplifying Method Calls_Remove Parameter"
        Category = "Simplifying Method Calls"
        Pattern = "Remove Parameter"
    },
    @{
        ProjectName = "Simplifying Method Calls_Separate Query from Modifier"
        Category = "Simplifying Method Calls"
        Pattern = "Separate Query from Modifier"
    },
    @{
        ProjectName = "Simplifying Method Calls_Parameterize Method"
        Category = "Simplifying Method Calls"
        Pattern = "Parameterize Method"
    },
    # F. Dealing with Generalization (4 projects)
    @{
        ProjectName = "Dealing with Generalization_Pull Up Method"
        Category = "Dealing with Generalization"
        Pattern = "Pull Up Method"
    },
    @{
        ProjectName = "Dealing with Generalization_Push Down Method"
        Category = "Dealing with Generalization"
        Pattern = "Push Down Method"
    },
    @{
        ProjectName = "Dealing with Generalization_Extract Superclass"
        Category = "Dealing with Generalization"
        Pattern = "Extract Superclass"
    },
    @{
        ProjectName = "Dealing with Generalization_Form Template Method"
        Category = "Dealing with Generalization"
        Pattern = "Form Template Method"
    }
)

# Template functions for different refactoring patterns
function Get-ExtractMethodBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public void PrintOrderDetails(int orderId, decimal amount, string customerName)
        {
            // Long method doing multiple things
            Console.WriteLine("=== Order Details ===");
            Console.WriteLine("Order ID: " + orderId);
            Console.WriteLine("Customer: " + customerName);
            Console.WriteLine("Amount: " + amount);
            Console.WriteLine("Subtotal: " + (amount * 0.95m));
            Console.WriteLine("Tax: " + (amount * 0.1m));
            Console.WriteLine("Total: " + (amount * 1.1m));
            Console.WriteLine("==================");
        }
    }
}
"@
}

function Get-ExtractMethodAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public void PrintOrderDetails(int orderId, decimal amount, string customerName)
        {
            PrintHeader();
            PrintBasicInfo(orderId, customerName);
            PrintPricing(amount);
            PrintFooter();
        }

        private void PrintHeader()
        {
            Console.WriteLine("=== Order Details ===");
        }

        private void PrintBasicInfo(int orderId, string customerName)
        {
            Console.WriteLine("Order ID: " + orderId);
            Console.WriteLine("Customer: " + customerName);
        }

        private void PrintPricing(decimal amount)
        {
            Console.WriteLine("Amount: " + amount);
            Console.WriteLine("Subtotal: " + (amount * 0.95m));
            Console.WriteLine("Tax: " + (amount * 0.1m));
            Console.WriteLine("Total: " + (amount * 1.1m));
        }

        private void PrintFooter()
        {
            Console.WriteLine("==================");
        }
    }
}
"@
}

function Get-ExtractMethodReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public void ProcessInvoice(string invoiceNumber, decimal invoiceAmount, string vendorName, DateTime invoiceDate)
        {
            PrintInvoiceHeader(invoiceNumber, invoiceDate);
            PrintVendorInfo(vendorName);
            PrintFinancialDetails(invoiceAmount);
            PrintInvoiceFooter();
        }

        private void PrintInvoiceHeader(string invoiceNumber, DateTime date)
        {
            Console.WriteLine("??????????????????????????????");
            Console.WriteLine("?      INVOICE               ?");
            Console.WriteLine("? Invoice #: " + invoiceNumber.PadRight(15) + "?");
            Console.WriteLine("? Date: " + date.ToString("dd/MM/yyyy").PadRight(19) + "?");
        }

        private void PrintVendorInfo(string vendorName)
        {
            Console.WriteLine("? Vendor: " + vendorName.PadRight(18) + "?");
        }

        private void PrintFinancialDetails(decimal amount)
        {
            decimal tax = amount * 0.08m;
            decimal total = amount + tax;
            Console.WriteLine("? Amount: " + amount.ToString("C").PadRight(18) + "?");
            Console.WriteLine("? Tax: " + tax.ToString("C").PadRight(20) + "?");
            Console.WriteLine("? Total: " + total.ToString("C").PadRight(19) + "?");
        }

        private void PrintInvoiceFooter()
        {
            Console.WriteLine("??????????????????????????????");
        }
    }
}
"@
}

function Get-InlineMethodBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public int GetPrice()
        {
            int basePrice = 100;
            return ApplyDiscount(basePrice);
        }

        private int ApplyDiscount(int price)
        {
            return price - 10;
        }
    }
}
"@
}

function Get-InlineMethodAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public int GetPrice()
        {
            int basePrice = 100;
            return basePrice - 10;
        }
    }
}
"@
}

function Get-InlineMethodReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public decimal CalculateFinalPrice(decimal productPrice, int quantity)
        {
            decimal subtotal = productPrice * quantity;
            return subtotal * 0.9m;
        }
    }
}
"@
}

function Get-ExtractVariableBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public void RenderBanner()
        {
            if (5 > 3 && 10 < 20)
            {
                Console.WriteLine("Welcome!");
            }
        }
    }
}
"@
}

function Get-ExtractVariableAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public void RenderBanner()
        {
            bool isValidUser = 5 > 3;
            bool isWithinRange = 10 < 20;
            if (isValidUser && isWithinRange)
            {
                Console.WriteLine("Welcome!");
            }
        }
    }
}
"@
}

function Get-ExtractVariableReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public decimal CalculateOrderTotal(decimal itemPrice, int quantity, decimal taxRate, decimal shippingCost)
        {
            decimal subtotal = itemPrice * quantity;
            decimal tax = subtotal * taxRate;
            decimal total = subtotal + tax + shippingCost;
            return total;
        }
    }
}
"@
}

function Get-InlineTempBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public int GetTotal(int a, int b)
        {
            int result = a + b;
            return result;
        }
    }
}
"@
}

function Get-InlineTempAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public int GetTotal(int a, int b)
        {
            return a + b;
        }
    }
}
"@
}

function Get-InlineTempReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public decimal CalculateDiscount(decimal originalPrice, int discountPercent)
        {
            return originalPrice * (1 - discountPercent / 100m);
        }
    }
}
"@
}

function Get-ReplaceTempWithQueryBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public int GetOrderTotal()
        {
            int basePrice = 100;
            int quantity = 5;
            int temp = basePrice * quantity;
            if (temp > 1000)
                temp -= 100;
            return temp;
        }
    }
}
"@
}

function Get-ReplaceTempWithQueryAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public int GetOrderTotal()
        {
            if (GetPrice() > 1000)
                return GetPrice() - 100;
            return GetPrice();
        }

        private int GetPrice()
        {
            return 100 * 5;
        }
    }
}
"@
}

function Get-ReplaceTempWithQueryReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public decimal CalculateOrderDiscount(int[] itemPrices)
        {
            decimal total = GetOrderTotal(itemPrices);
            if (total >= 500)
                return total * 0.15m;
            else if (total >= 200)
                return total * 0.1m;
            return 0;
        }

        private decimal GetOrderTotal(int[] prices)
        {
            decimal sum = 0;
            foreach (int price in prices)
                sum += price;
            return sum;
        }
    }
}
"@
}

function Get-SplitTemporaryVariableBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public void CalculateShipping(int distance, int weight)
        {
            double temp = distance * 2;
            Console.WriteLine("Shipping base: " + temp);
            temp = temp + weight * 0.5;
            Console.WriteLine("Final shipping cost: " + temp);
        }
    }
}
"@
}

function Get-SplitTemporaryVariableAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public void CalculateShipping(int distance, int weight)
        {
            double baseShipping = distance * 2;
            Console.WriteLine("Shipping base: " + baseShipping);
            double weightCharge = weight * 0.5;
            double totalShipping = baseShipping + weightCharge;
            Console.WriteLine("Final shipping cost: " + totalShipping);
        }
    }
}
"@
}

function Get-SplitTemporaryVariableReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public decimal CalculateProjectCost(int hours, decimal hourlyRate, decimal materialCost, int numberOfResources)
        {
            decimal laborCost = hours * hourlyRate;
            decimal resourceCost = materialCost * numberOfResources;
            decimal totalProjectCost = laborCost + resourceCost;
            return totalProjectCost;
        }
    }
}
"@
}

function Get-RemoveAssignmentsBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public int CalculateTotal(int price, int quantity, int discount)
        {
            price = price * quantity;
            price = price - discount;
            return price;
        }
    }
}
"@
}

function Get-RemoveAssignmentsAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public int CalculateTotal(int price, int quantity, int discount)
        {
            int total = price * quantity;
            total = total - discount;
            return total;
        }
    }
}
"@
}

function Get-RemoveAssignmentsReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public decimal ApplyBillingCalculation(decimal hourlyRate, int hoursWorked, decimal bonusAmount)
        {
            decimal basePay = hourlyRate * hoursWorked;
            decimal finalPayment = basePay + bonusAmount;
            return finalPayment;
        }
    }
}
"@
}

function Get-MoveMethodBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Account
        {
            private decimal balance = 1000;

            public decimal GetOverdraftFee()
            {
                return 100;
            }
        }

        public class Loan
        {
            private Account account;

            public void ApplyMonthlyFee()
            {
                decimal fee = account.GetOverdraftFee();
                Console.WriteLine("Fee: " + fee);
            }
        }
    }
}
"@
}

function Get-MoveMethodAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Account
        {
            private decimal balance = 1000;

            public decimal GetOverdraftFee()
            {
                return 100;
            }
        }

        public class Loan
        {
            private Account account;

            public void ApplyMonthlyFee()
            {
                decimal fee = GetMonthlyFee();
                Console.WriteLine("Fee: " + fee);
            }

            private decimal GetMonthlyFee()
            {
                return 50;
            }
        }
    }
}
"@
}

function Get-MoveMethodReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class Product
        {
            public decimal Price { get; set; }
        }

        public class ShoppingCart
        {
            private List<Product> items = new List<Product>();

            public void AddProduct(Product product)
            {
                items.Add(product);
            }

            public decimal CalculateTotalPrice()
            {
                decimal total = 0;
                foreach (var item in items)
                    total += item.Price;
                return total;
            }
        }
    }
}
"@
}

function Get-MoveFieldBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Person
        {
            public string Name { get; set; }
            public string PhoneNumber { get; set; }
        }

        public class Employee
        {
            public Person person;
            public decimal Salary { get; set; }
        }
    }
}
"@
}

function Get-MoveFieldAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class ContactInfo
        {
            public string Name { get; set; }
            public string PhoneNumber { get; set; }
        }

        public class Employee
        {
            public ContactInfo contact;
            public decimal Salary { get; set; }
        }
    }
}
"@
}

function Get-MoveFieldReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class Order
        {
            public int OrderId { get; set; }
            public string CustomerName { get; set; }
            public DateTime OrderDate { get; set; }
            public decimal TotalAmount { get; set; }
        }

        public class Invoice
        {
            public Order order;
            public decimal TaxAmount { get; set; }
        }
    }
}
"@
}

function Get-ExtractClassBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Person
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string AreaCode { get; set; }
            public string Number { get; set; }

            public string GetPhoneNumber()
            {
                return AreaCode + "-" + Number;
            }
        }
    }
}
"@
}

function Get-ExtractClassAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class PhoneNumber
        {
            public string AreaCode { get; set; }
            public string Number { get; set; }

            public string GetPhoneNumber()
            {
                return AreaCode + "-" + Number;
            }
        }

        public class Person
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public PhoneNumber Phone { get; set; }
        }
    }
}
"@
}

function Get-ExtractClassReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class Address
        {
            public string Street { get; set; }
            public string City { get; set; }
            public string PostalCode { get; set; }

            public string GetFullAddress()
            {
                return Street + ", " + City + " " + PostalCode;
            }
        }

        public class Customer
        {
            public string Name { get; set; }
            public Address ShippingAddress { get; set; }
            public Address BillingAddress { get; set; }
        }
    }
}
"@
}

function Get-InlineClassBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class TelephoneNumber
        {
            public string AreaCode { get; set; }
            public string Number { get; set; }
        }

        public class Person
        {
            public string Name { get; set; }
            public TelephoneNumber PhoneNumber { get; set; }
        }
    }
}
"@
}

function Get-InlineClassAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Person
        {
            public string Name { get; set; }
            public string AreaCode { get; set; }
            public string Number { get; set; }

            public string GetPhoneNumber()
            {
                return AreaCode + "-" + Number;
            }
        }
    }
}
"@
}

function Get-InlineClassReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class TrackingInfo
        {
            public string TrackingNumber { get; set; }
            public DateTime ShippedDate { get; set; }
        }

        public class Shipment
        {
            public string TrackingNumber { get; set; }
            public DateTime ShippedDate { get; set; }
            public string Status { get; set; }
        }
    }
}
"@
}

function Get-SelfEncapsulateFieldBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class User
        {
            public int age;

            public void SetAge(int newAge)
            {
                age = newAge;
            }

            public int GetAge()
            {
                return age;
            }
        }
    }
}
"@
}

function Get-SelfEncapsulateFieldAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class User
        {
            private int _age;

            public void SetAge(int newAge)
            {
                if (newAge < 0)
                    _age = 0;
                else
                    _age = newAge;
            }

            public int GetAge()
            {
                return _age;
            }
        }
    }
}
"@
}

function Get-SelfEncapsulateFieldReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class Employee
        {
            private decimal _salary;

            public void SetSalary(decimal newSalary)
            {
                if (newSalary < 0)
                    throw new ArgumentException("Salary cannot be negative");
                _salary = newSalary;
            }

            public decimal GetSalary()
            {
                return _salary;
            }
        }
    }
}
"@
}

function Get-ReplaceMagicNumberBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public decimal CalculatePrice(decimal quantity, decimal unitPrice)
        {
            return quantity * unitPrice * 1.1m;
        }

        public bool IsEligibleForDiscount(int purchaseCount)
        {
            return purchaseCount > 10;
        }
    }
}
"@
}

function Get-ReplaceMagicNumberAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        private const decimal TAX_RATE = 1.1m;
        private const int DISCOUNT_THRESHOLD = 10;

        public decimal CalculatePrice(decimal quantity, decimal unitPrice)
        {
            return quantity * unitPrice * TAX_RATE;
        }

        public bool IsEligibleForDiscount(int purchaseCount)
        {
            return purchaseCount > DISCOUNT_THRESHOLD;
        }
    }
}
"@
}

function Get-ReplaceMagicNumberReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        private const decimal STANDARD_TAX = 0.08m;
        private const decimal PREMIUM_TAX = 0.10m;
        private const int VIP_MINIMUM_PURCHASES = 50;
        private const decimal VIP_DISCOUNT = 0.20m;

        public decimal CalculateTotalWithTax(decimal amount, bool isPremium)
        {
            decimal tax = isPremium ? PREMIUM_TAX : STANDARD_TAX;
            return amount + (amount * tax);
        }

        public decimal GetCustomerDiscount(int totalPurchases)
        {
            if (totalPurchases >= VIP_MINIMUM_PURCHASES)
                return VIP_DISCOUNT;
            return 0;
        }
    }
}
"@
}

function Get-EncapsulateFieldBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Employee
        {
            public string name;
            public decimal salary;
        }
    }
}
"@
}

function Get-EncapsulateFieldAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Employee
        {
            private string _name;
            private decimal _salary;

            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }

            public decimal Salary
            {
                get { return _salary; }
                set { _salary = value; }
            }
        }
    }
}
"@
}

function Get-EncapsulateFieldReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class BankAccount
        {
            private string _accountNumber;
            private decimal _balance;

            public string AccountNumber
            {
                get { return _accountNumber; }
                set { _accountNumber = value; }
            }

            public decimal Balance
            {
                get { return _balance; }
                private set { _balance = value; }
            }

            public void Deposit(decimal amount)
            {
                if (amount > 0)
                    Balance += amount;
            }

            public bool Withdraw(decimal amount)
            {
                if (amount > 0 && amount <= Balance)
                {
                    Balance -= amount;
                    return true;
                }
                return false;
            }
        }
    }
}
"@
}

function Get-EncapsulateCollectionBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Team
        {
            public List<string> Members;

            public Team()
            {
                Members = new List<string>();
            }
        }
    }
}
"@
}

function Get-EncapsulateCollectionAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Team
        {
            private List<string> _members;

            public Team()
            {
                _members = new List<string>();
            }

            public void AddMember(string name)
            {
                _members.Add(name);
            }

            public void RemoveMember(string name)
            {
                _members.Remove(name);
            }

            public List<string> GetMembers()
            {
                return new List<string>(_members);
            }
        }
    }
}
"@
}

function Get-EncapsulateCollectionReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class Project
        {
            private List<string> _tasks;

            public Project()
            {
                _tasks = new List<string>();
            }

            public void AddTask(string task)
            {
                if (!string.IsNullOrEmpty(task))
                    _tasks.Add(task);
            }

            public void RemoveTask(string task)
            {
                _tasks.Remove(task);
            }

            public List<string> GetTasks()
            {
                return new List<string>(_tasks);
            }

            public int GetTaskCount()
            {
                return _tasks.Count;
            }
        }
    }
}
"@
}

function Get-ReplaceTypeCodeBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Employee
        {
            public string Name { get; set; }
            public int Type { get; set; } // 1: Engineer, 2: Manager, 3: Sales

            public decimal GetBonus()
            {
                switch (Type)
                {
                    case 1: return 1000;
                    case 2: return 2000;
                    case 3: return 1500;
                    default: return 0;
                }
            }
        }
    }
}
"@
}

function Get-ReplaceTypeCodeAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public abstract class EmployeeType
        {
            public abstract decimal GetBonus();
        }

        public class Engineer : EmployeeType
        {
            public override decimal GetBonus() => 1000;
        }

        public class Manager : EmployeeType
        {
            public override decimal GetBonus() => 2000;
        }

        public class Sales : EmployeeType
        {
            public override decimal GetBonus() => 1500;
        }

        public class Employee
        {
            public string Name { get; set; }
            public EmployeeType Type { get; set; }

            public decimal GetBonus()
            {
                return Type.GetBonus();
            }
        }
    }
}
"@
}

function Get-ReplaceTypeCodeReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public abstract class PaymentMethod
        {
            public abstract decimal ProcessPayment(decimal amount);
        }

        public class CreditCard : PaymentMethod
        {
            public override decimal ProcessPayment(decimal amount)
            {
                return amount + (amount * 0.02m);
            }
        }

        public class BankTransfer : PaymentMethod
        {
            public override decimal ProcessPayment(decimal amount)
            {
                return amount;
            }
        }

        public class Wallet : PaymentMethod
        {
            public override decimal ProcessPayment(decimal amount)
            {
                return amount - 10;
            }
        }
    }
}
"@
}

function Get-DecomposeConditionalBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public void CheckUserAccess(int age, bool hasLicense, bool isEmployee)
        {
            if (age >= 18 && hasLicense && (isEmployee || age >= 21))
            {
                Console.WriteLine("Access granted");
            }
            else
            {
                Console.WriteLine("Access denied");
            }
        }
    }
}
"@
}

function Get-DecomposeConditionalAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public void CheckUserAccess(int age, bool hasLicense, bool isEmployee)
        {
            bool isAdult = age >= 18;
            bool canAccess = isAdult && hasLicense;
            bool isSpecialCase = isEmployee || age >= 21;

            if (canAccess && isSpecialCase)
            {
                Console.WriteLine("Access granted");
            }
            else
            {
                Console.WriteLine("Access denied");
            }
        }
    }
}
"@
}

function Get-DecomposeConditionalReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public bool CanApplyForLoan(int creditScore, decimal monthlyIncome, int yearsEmployed)
        {
            bool hasGoodCredit = creditScore >= 650;
            bool hasSufficientIncome = monthlyIncome >= 3000;
            bool hasStableEmployment = yearsEmployed >= 2;

            bool meetsBasicRequirements = hasGoodCredit && hasSufficientIncome;
            bool isEligible = meetsBasicRequirements && hasStableEmployment;

            return isEligible;
        }
    }
}
"@
}

function Get-ConsolidateConditionalBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public bool IsSpecialCustomer(string status, int yearsAsCustomer)
        {
            if (status == "Premium")
                return true;
            if (yearsAsCustomer > 5)
                return true;
            return false;
        }
    }
}
"@
}

function Get-ConsolidateConditionalAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public bool IsSpecialCustomer(string status, int yearsAsCustomer)
        {
            return status == "Premium" || yearsAsCustomer > 5;
        }
    }
}
"@
}

function Get-ConsolidateConditionalReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public bool IsEligibleForDiscount(decimal purchaseAmount, bool isMember, DateTime lastPurchaseDate)
        {
            bool largeOrder = purchaseAmount > 1000;
            bool isLoyalMember = isMember && (DateTime.Now - lastPurchaseDate).Days < 30;
            return largeOrder || isLoyalMember;
        }
    }
}
"@
}

function Get-GuardClausesBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public decimal CalculateDiscount(int quantity, decimal price)
        {
            if (quantity > 0)
            {
                if (price > 0)
                {
                    if (quantity > 100)
                    {
                        return price * quantity * 0.2m;
                    }
                    else
                    {
                        return price * quantity * 0.1m;
                    }
                }
            }
            return 0;
        }
    }
}
"@
}

function Get-GuardClausesAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public decimal CalculateDiscount(int quantity, decimal price)
        {
            if (quantity <= 0 || price <= 0)
                return 0;

            if (quantity > 100)
                return price * quantity * 0.2m;

            return price * quantity * 0.1m;
        }
    }
}
"@
}

function Get-GuardClausesReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public void ProcessOrder(string customerName, decimal orderAmount, int quantity)
        {
            if (string.IsNullOrEmpty(customerName))
            {
                Console.WriteLine("Error: Customer name required");
                return;
            }

            if (orderAmount <= 0)
            {
                Console.WriteLine("Error: Order amount must be positive");
                return;
            }

            if (quantity <= 0)
            {
                Console.WriteLine("Error: Quantity must be positive");
                return;
            }

            Console.WriteLine(\$"Processing order for {customerName}: {quantity} items at {orderAmount}\");
        }
    }
}
"@
}

function Get-ReplaceConditionalWithPolymorphismBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Bird
        {
            public string Type { get; set; }

            public string GetSound()
            {
                if (Type == "Parrot")
                    return "Squawk";
                else if (Type == "Owl")
                    return "Hoot";
                else if (Type == "Duck")
                    return "Quack";
                return "Unknown";
            }
        }
    }
}
"@
}

function Get-ReplaceConditionalWithPolymorphismAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public abstract class Bird
        {
            public abstract string GetSound();
        }

        public class Parrot : Bird
        {
            public override string GetSound() => "Squawk";
        }

        public class Owl : Bird
        {
            public override string GetSound() => "Hoot";
        }

        public class Duck : Bird
        {
            public override string GetSound() => "Quack";
        }
    }
}
"@
}

function Get-ReplaceConditionalWithPolymorphismReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public abstract class PaymentProcessor
        {
            public abstract decimal CalculateTotal(decimal amount);
        }

        public class CreditCardProcessor : PaymentProcessor
        {
            public override decimal CalculateTotal(decimal amount)
            {
                return amount + (amount * 0.03m);
            }
        }

        public class PayPalProcessor : PaymentProcessor
        {
            public override decimal CalculateTotal(decimal amount)
            {
                return amount + (amount * 0.04m);
            }
        }

        public class CashProcessor : PaymentProcessor
        {
            public override decimal CalculateTotal(decimal amount)
            {
                return amount;
            }
        }
    }
}
"@
}

function Get-IntroduceNullObjectBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Customer
        {
            public string Name { get; set; }
        }

        public void PrintCustomerInfo(Customer customer)
        {
            if (customer != null)
            {
                Console.WriteLine("Customer: " + customer.Name);
            }
            else
            {
                Console.WriteLine("Customer: Unknown");
            }
        }
    }
}
"@
}

function Get-IntroduceNullObjectAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public abstract class Customer
        {
            public abstract string GetName();
        }

        public class RealCustomer : Customer
        {
            public string Name { get; set; }
            public override string GetName() => Name;
        }

        public class NullCustomer : Customer
        {
            public override string GetName() => "Unknown Customer";
        }

        public void PrintCustomerInfo(Customer customer)
        {
            Console.WriteLine("Customer: " + customer.GetName());
        }
    }
}
"@
}

function Get-IntroduceNullObjectReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public abstract class Logger
        {
            public abstract void Log(string message);
        }

        public class ConsoleLogger : Logger
        {
            public override void Log(string message)
            {
                Console.WriteLine("[LOG] " + message);
            }
        }

        public class NullLogger : Logger
        {
            public override void Log(string message)
            {
                // Do nothing
            }
        }

        public class Application
        {
            private Logger _logger;

            public Application(Logger logger)
            {
                _logger = logger ?? new NullLogger();
            }

            public void Run()
            {
                _logger.Log("Application started");
            }
        }
    }
}
"@
}

function Get-RenameMethodBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Employee
        {
            private decimal salary;

            public decimal GetSal()
            {
                return salary;
            }

            public void SetSal(decimal newSalary)
            {
                salary = newSalary;
            }
        }
    }
}
"@
}

function Get-RenameMethodAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Employee
        {
            private decimal salary;

            public decimal GetSalary()
            {
                return salary;
            }

            public void SetSalary(decimal newSalary)
            {
                salary = newSalary;
            }
        }
    }
}
"@
}

function Get-RenameMethodReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class Order
        {
            private List<decimal> items = new List<decimal>();

            public decimal CalculateTotal()
            {
                decimal total = 0;
                foreach (var price in items)
                    total += price;
                return total;
            }

            public void AddItem(decimal price)
            {
                items.Add(price);
            }

            public int GetItemCount()
            {
                return items.Count;
            }
        }
    }
}
"@
}

function Get-AddParameterBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Printer
        {
            public void Print(string text)
            {
                Console.WriteLine("Printing: " + text);
            }
        }
    }
}
"@
}

function Get-AddParameterAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Printer
        {
            public void Print(string text, bool isUrgent)
            {
                string prefix = isUrgent ? "[URGENT] " : "";
                Console.WriteLine(prefix + "Printing: " + text);
            }
        }
    }
}
"@
}

function Get-AddParameterReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class EmailService
        {
            public void SendEmail(string to, string subject, string body, bool isHtml = false)
            {
                string contentType = isHtml ? "text/html" : "text/plain";
                Console.WriteLine(\$"Sending email to {to} with content type: {contentType}\");
                Console.WriteLine(\$"Subject: {subject}\");
                Console.WriteLine(\$"Body: {body}\");
            }
        }
    }
}
"@
}

function Get-RemoveParameterBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Calculator
        {
            public int Add(int a, int b, int unusedParam)
            {
                return a + b;
            }
        }
    }
}
"@
}

function Get-RemoveParameterAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Calculator
        {
            public int Add(int a, int b)
            {
                return a + b;
            }
        }
    }
}
"@
}

function Get-RemoveParameterReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class UserService
        {
            public bool AuthenticateUser(string username, string password)
            {
                return !string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password);
            }

            public void LogActivity(string username, string activity)
            {
                Console.WriteLine(\$"[{DateTime.Now}] User {username}: {activity}\");
            }
        }
    }
}
"@
}

function Get-SeparateQueryFromModifierBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Item
        {
            private int quantity;

            public int GetAndResetQuantity()
            {
                int temp = quantity;
                quantity = 0;
                return temp;
            }
        }
    }
}
"@
}

function Get-SeparateQueryFromModifierAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Item
        {
            private int quantity;

            public int GetQuantity()
            {
                return quantity;
            }

            public void ResetQuantity()
            {
                quantity = 0;
            }
        }
    }
}
"@
}

function Get-SeparateQueryFromModifierReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class Queue
        {
            private List<string> items = new List<string>();

            public string Dequeue()
            {
                if (items.Count == 0)
                    return null;
                string first = items[0];
                items.RemoveAt(0);
                return first;
            }

            public int GetQueueSize()
            {
                return items.Count;
            }

            public void Enqueue(string item)
            {
                items.Add(item);
            }
        }
    }
}
"@
}

function Get-ParameterizeBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Multiplier
        {
            public int MultiplyBy2(int x) { return x * 2; }
            public int MultiplyBy3(int x) { return x * 3; }
            public int MultiplyBy5(int x) { return x * 5; }
        }
    }
}
"@
}

function Get-ParameterizeAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Multiplier
        {
            public int Multiply(int x, int factor)
            {
                return x * factor;
            }
        }
    }
}
"@
}

function Get-ParameterizeReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public class Discount
        {
            public decimal ApplyDiscount(decimal amount, decimal discountPercent)
            {
                return amount * (1 - discountPercent / 100m);
            }

            public decimal Apply10PercentDiscount(decimal amount)
            {
                return ApplyDiscount(amount, 10);
            }

            public decimal Apply20PercentDiscount(decimal amount)
            {
                return ApplyDiscount(amount, 20);
            }
        }
    }
}
"@
}

function Get-PullUpMethodBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Manager
        {
            public decimal GetBonus()
            {
                return 5000;
            }
        }

        public class Developer
        {
            public decimal GetBonus()
            {
                return 3000;
            }
        }
    }
}
"@
}

function Get-PullUpMethodAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public abstract class Employee
        {
            public abstract decimal GetBonus();
        }

        public class Manager : Employee
        {
            public override decimal GetBonus()
            {
                return 5000;
            }
        }

        public class Developer : Employee
        {
            public override decimal GetBonus()
            {
                return 3000;
            }
        }
    }
}
"@
}

function Get-PullUpMethodReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public abstract class Shape
        {
            public abstract decimal GetArea();
            public abstract decimal GetPerimeter();
        }

        public class Circle : Shape
        {
            private decimal radius;

            public Circle(decimal r) { radius = r; }

            public override decimal GetArea()
            {
                return 3.14159m * radius * radius;
            }

            public override decimal GetPerimeter()
            {
                return 2 * 3.14159m * radius;
            }
        }

        public class Rectangle : Shape
        {
            private decimal width, height;

            public Rectangle(decimal w, decimal h) { width = w; height = h; }

            public override decimal GetArea()
            {
                return width * height;
            }

            public override decimal GetPerimeter()
            {
                return 2 * (width + height);
            }
        }
    }
}
"@
}

function Get-PushDownMethodBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Employee
        {
            public virtual decimal GetSpecialBonus()
            {
                return 0;
            }
        }

        public class Manager : Employee
        {
            public override decimal GetSpecialBonus()
            {
                return 1000;
            }
        }

        public class Intern : Employee
        {
        }
    }
}
"@
}

function Get-PushDownMethodAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public class Employee
        {
        }

        public class Manager : Employee
        {
            public decimal GetSpecialBonus()
            {
                return 1000;
            }
        }

        public class Intern : Employee
        {
        }
    }
}
"@
}

function Get-PushDownMethodReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public abstract class Vehicle
        {
            public abstract decimal GetPrice();
        }

        public class Car : Vehicle
        {
            public override decimal GetPrice() => 25000;

            public decimal GetInsuranceCost()
            {
                return GetPrice() * 0.05m;
            }
        }

        public class Bicycle : Vehicle
        {
            public override decimal GetPrice() => 500;
        }
    }
}
"@
}

function Get-ExtractSuperclassBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class Cat
        {
            public string Name { get; set; }
            public void Eat() { Console.WriteLine("Eating..."); }
            public void Sleep() { Console.WriteLine("Sleeping..."); }
        }

        public class Dog
        {
            public string Name { get; set; }
            public void Eat() { Console.WriteLine("Eating..."); }
            public void Sleep() { Console.WriteLine("Sleeping..."); }
        }
    }
}
"@
}

function Get-ExtractSuperclassAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public abstract class Animal
        {
            public string Name { get; set; }
            public virtual void Eat() { Console.WriteLine("Eating..."); }
            public virtual void Sleep() { Console.WriteLine("Sleeping..."); }
        }

        public class Cat : Animal
        {
        }

        public class Dog : Animal
        {
        }
    }
}
"@
}

function Get-ExtractSuperclassReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public abstract class DatabaseConnection
        {
            protected string ConnectionString { get; set; }

            public virtual void Connect()
            {
                Console.WriteLine("Connecting...");
            }

            public virtual void Disconnect()
            {
                Console.WriteLine("Disconnecting...");
            }

            public abstract void ExecuteQuery(string query);
        }

        public class SqlServerConnection : DatabaseConnection
        {
            public override void ExecuteQuery(string query)
            {
                Console.WriteLine("Executing SQL Server query: " + query);
            }
        }

        public class MySqlConnection : DatabaseConnection
        {
            public override void ExecuteQuery(string query)
            {
                Console.WriteLine("Executing MySQL query: " + query);
            }
        }
    }
}
"@
}

function Get-FormTemplateMethodBefore {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Before
    {
        public class ReportA
        {
            public void Generate()
            {
                Console.WriteLine("Opening connection...");
                Console.WriteLine("Gathering data for Report A...");
                Console.WriteLine("Formatting Report A...");
                Console.WriteLine("Saving Report A...");
                Console.WriteLine("Closing connection...");
            }
        }

        public class ReportB
        {
            public void Generate()
            {
                Console.WriteLine("Opening connection...");
                Console.WriteLine("Gathering data for Report B...");
                Console.WriteLine("Formatting Report B...");
                Console.WriteLine("Saving Report B...");
                Console.WriteLine("Closing connection...");
            }
        }
    }
}
"@
}

function Get-FormTemplateMethodAfter {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class After
    {
        public abstract class Report
        {
            public void Generate()
            {
                OpenConnection();
                GatherData();
                FormatReport();
                SaveReport();
                CloseConnection();
            }

            protected void OpenConnection() { Console.WriteLine("Opening connection..."); }
            protected void CloseConnection() { Console.WriteLine("Closing connection..."); }

            protected abstract void GatherData();
            protected abstract void FormatReport();
            protected abstract void SaveReport();
        }

        public class ReportA : Report
        {
            protected override void GatherData() { Console.WriteLine("Gathering data for Report A..."); }
            protected override void FormatReport() { Console.WriteLine("Formatting Report A..."); }
            protected override void SaveReport() { Console.WriteLine("Saving Report A..."); }
        }

        public class ReportB : Report
        {
            protected override void GatherData() { Console.WriteLine("Gathering data for Report B..."); }
            protected override void FormatReport() { Console.WriteLine("Formatting Report B..."); }
            protected override void SaveReport() { Console.WriteLine("Saving Report B..."); }
        }
    }
}
"@
}

function Get-FormTemplateMethodReal {
    param([string]$ProjectName)
    return @"
namespace $ProjectName
{
    public class Real
    {
        public abstract class DataProcessor
        {
            public void Process(string filePath)
            {
                string data = ReadFile(filePath);
                data = ValidateData(data);
                data = TransformData(data);
                SaveProcessedData(data);
                LogCompletion();
            }

            private string ReadFile(string filePath)
            {
                Console.WriteLine("Reading file: " + filePath);
                return "raw data";
            }

            protected abstract string ValidateData(string data);
            protected abstract string TransformData(string data);

            private void SaveProcessedData(string data)
            {
                Console.WriteLine("Saving processed data...");
            }

            private void LogCompletion()
            {
                Console.WriteLine("Process completed at: " + DateTime.Now);
            }
        }

        public class CsvProcessor : DataProcessor
        {
            protected override string ValidateData(string data)
            {
                Console.WriteLine("Validating CSV data...");
                return data;
            }

            protected override string TransformData(string data)
            {
                Console.WriteLine("Transforming to CSV format...");
                return data;
            }
        }

        public class JsonProcessor : DataProcessor
        {
            protected override string ValidateData(string data)
            {
                Console.WriteLine("Validating JSON data...");
                return data;
            }

            protected override string TransformData(string data)
            {
                Console.WriteLine("Transforming to JSON format...");
                return data;
            }
        }
    }
}
"@
}

# Dictionary to map pattern names to template functions
$templateFunctions = @{
    "Composing Methods_Extract Method" = @{ Before = "Get-ExtractMethodBefore"; After = "Get-ExtractMethodAfter"; Real = "Get-ExtractMethodReal" }
    "Composing Methods_Inline Method" = @{ Before = "Get-InlineMethodBefore"; After = "Get-InlineMethodAfter"; Real = "Get-InlineMethodReal" }
    "Composing Methods_Extract Variable" = @{ Before = "Get-ExtractVariableBefore"; After = "Get-ExtractVariableAfter"; Real = "Get-ExtractVariableReal" }
    "Composing Methods_Inline Temp" = @{ Before = "Get-InlineTempBefore"; After = "Get-InlineTempAfter"; Real = "Get-InlineTempReal" }
    "Composing Methods_Replace Temp with Query" = @{ Before = "Get-ReplaceTempWithQueryBefore"; After = "Get-ReplaceTempWithQueryAfter"; Real = "Get-ReplaceTempWithQueryReal" }
    "Composing Methods_Split Temporary Variable" = @{ Before = "Get-SplitTemporaryVariableBefore"; After = "Get-SplitTemporaryVariableAfter"; Real = "Get-SplitTemporaryVariableReal" }
    "Composing Methods_Remove Assignments to Parameters" = @{ Before = "Get-RemoveAssignmentsBefore"; After = "Get-RemoveAssignmentsAfter"; Real = "Get-RemoveAssignmentsReal" }
    "Moving Features_Move Method" = @{ Before = "Get-MoveMethodBefore"; After = "Get-MoveMethodAfter"; Real = "Get-MoveMethodReal" }
    "Moving Features_Move Field" = @{ Before = "Get-MoveFieldBefore"; After = "Get-MoveFieldAfter"; Real = "Get-MoveFieldReal" }
    "Moving Features_Extract Class" = @{ Before = "Get-ExtractClassBefore"; After = "Get-ExtractClassAfter"; Real = "Get-ExtractClassReal" }
    "Moving Features_Inline Class" = @{ Before = "Get-InlineClassBefore"; After = "Get-InlineClassAfter"; Real = "Get-InlineClassReal" }
    "Organizing Data_Self Encapsulate Field" = @{ Before = "Get-SelfEncapsulateFieldBefore"; After = "Get-SelfEncapsulateFieldAfter"; Real = "Get-SelfEncapsulateFieldReal" }
    "Organizing Data_Replace Magic Number with Symbolic Constant" = @{ Before = "Get-ReplaceMagicNumberBefore"; After = "Get-ReplaceMagicNumberAfter"; Real = "Get-ReplaceMagicNumberReal" }
    "Organizing Data_Encapsulate Field" = @{ Before = "Get-EncapsulateFieldBefore"; After = "Get-EncapsulateFieldAfter"; Real = "Get-EncapsulateFieldReal" }
    "Organizing Data_Encapsulate Collection" = @{ Before = "Get-EncapsulateCollectionBefore"; After = "Get-EncapsulateCollectionAfter"; Real = "Get-EncapsulateCollectionReal" }
    "Organizing Data_Replace Type Code with Class" = @{ Before = "Get-ReplaceTypeCodeBefore"; After = "Get-ReplaceTypeCodeAfter"; Real = "Get-ReplaceTypeCodeReal" }
    "Simplifying Conditionals_Decompose Conditional" = @{ Before = "Get-DecomposeConditionalBefore"; After = "Get-DecomposeConditionalAfter"; Real = "Get-DecomposeConditionalReal" }
    "Simplifying Conditionals_Consolidate Conditional Expression" = @{ Before = "Get-ConsolidateConditionalBefore"; After = "Get-ConsolidateConditionalAfter"; Real = "Get-ConsolidateConditionalReal" }
    "Simplifying Conditionals_Guard Clauses" = @{ Before = "Get-GuardClausesBefore"; After = "Get-GuardClausesAfter"; Real = "Get-GuardClausesReal" }
    "Simplifying Conditionals_Replace Conditional with Polymorphism" = @{ Before = "Get-ReplaceConditionalWithPolymorphismBefore"; After = "Get-ReplaceConditionalWithPolymorphismAfter"; Real = "Get-ReplaceConditionalWithPolymorphismReal" }
    "Simplifying Conditionals_Introduce Null Object" = @{ Before = "Get-IntroduceNullObjectBefore"; After = "Get-IntroduceNullObjectAfter"; Real = "Get-IntroduceNullObjectReal" }
    "Simplifying Method Calls_Rename Method" = @{ Before = "Get-RenameMethodBefore"; After = "Get-RenameMethodAfter"; Real = "Get-RenameMethodReal" }
    "Simplifying Method Calls_Add Parameter" = @{ Before = "Get-AddParameterBefore"; After = "Get-AddParameterAfter"; Real = "Get-AddParameterReal" }
    "Simplifying Method Calls_Remove Parameter" = @{ Before = "Get-RemoveParameterBefore"; After = "Get-RemoveParameterAfter"; Real = "Get-RemoveParameterReal" }
    "Simplifying Method Calls_Separate Query from Modifier" = @{ Before = "Get-SeparateQueryFromModifierBefore"; After = "Get-SeparateQueryFromModifierAfter"; Real = "Get-SeparateQueryFromModifierReal" }
    "Simplifying Method Calls_Parameterize Method" = @{ Before = "Get-ParameterizeBefore"; After = "Get-ParameterizeAfter"; Real = "Get-ParameterizeReal" }
    "Dealing with Generalization_Pull Up Method" = @{ Before = "Get-PullUpMethodBefore"; After = "Get-PullUpMethodAfter"; Real = "Get-PullUpMethodReal" }
    "Dealing with Generalization_Push Down Method" = @{ Before = "Get-PushDownMethodBefore"; After = "Get-PushDownMethodAfter"; Real = "Get-PushDownMethodReal" }
    "Dealing with Generalization_Extract Superclass" = @{ Before = "Get-ExtractSuperclassBefore"; After = "Get-ExtractSuperclassAfter"; Real = "Get-ExtractSuperclassReal" }
    "Dealing with Generalization_Form Template Method" = @{ Before = "Get-FormTemplateMethodBefore"; After = "Get-FormTemplateMethodAfter"; Real = "Get-FormTemplateMethodReal" }
}

$createdCount = 0
$existingCount = 0

foreach ($pattern in $refactoringPatterns) {
    $projectName = $pattern.ProjectName
    $projectPath = Join-Path $solutionDir $projectName
    $csprojFile = Join-Path $projectPath "$projectName.csproj"

    if (Test-Path $projectPath) {
        Write-Host "Project '$projectName' already exists." -ForegroundColor Yellow

        # Check if it has all required files
        $beforeFile = Join-Path $projectPath "Before.cs"
        $afterFile = Join-Path $projectPath "After.cs"
        $realFile = Join-Path $projectPath "Real.cs"

        $missingFiles = @()
        if (-not (Test-Path $beforeFile)) { $missingFiles += "Before.cs" }
        if (-not (Test-Path $afterFile)) { $missingFiles += "After.cs" }
        if (-not (Test-Path $realFile)) { $missingFiles += "Real.cs" }

        if ($missingFiles.Count -gt 0) {
            Write-Host "  Missing files: $($missingFiles -join ', ') - Creating them..." -ForegroundColor Yellow

            $templateFuncs = $templateFunctions[$projectName]
            if ($templateFuncs) {
                if ($missingFiles -contains "Before.cs") {
                    $beforeContent = & $templateFuncs.Before -ProjectName $projectName
                    Set-Content -Path (Join-Path $projectPath "Before.cs") -Value $beforeContent
                    Write-Host "  ? Created Before.cs" -ForegroundColor Green
                }
                if ($missingFiles -contains "After.cs") {
                    $afterContent = & $templateFuncs.After -ProjectName $projectName
                    Set-Content -Path (Join-Path $projectPath "After.cs") -Value $afterContent
                    Write-Host "  ? Created After.cs" -ForegroundColor Green
                }
                if ($missingFiles -contains "Real.cs") {
                    $realContent = & $templateFuncs.Real -ProjectName $projectName
                    Set-Content -Path (Join-Path $projectPath "Real.cs") -Value $realContent
                    Write-Host "  ? Created Real.cs" -ForegroundColor Green
                }
            }
        } else {
            Write-Host "  All files present." -ForegroundColor Green
        }
        $existingCount++
        continue
    }

    Write-Host "Creating project: $projectName" -ForegroundColor Cyan

    # Create project directory
    New-Item -ItemType Directory -Path $projectPath -Force | Out-Null

    # Create .csproj file
    $csprojContent = @"
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net8.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
    <Nullable>enable</Nullable>
  </PropertyGroup>

</Project>
"@

    Set-Content -Path $csprojFile -Value $csprojContent

    # Get template content
    $templateFuncs = $templateFunctions[$projectName]
    if ($templateFuncs) {
        $beforeContent = & $templateFuncs.Before -ProjectName $projectName
        $afterContent = & $templateFuncs.After -ProjectName $projectName
        $realContent = & $templateFuncs.Real -ProjectName $projectName

        Set-Content -Path (Join-Path $projectPath "Before.cs") -Value $beforeContent
        Set-Content -Path (Join-Path $projectPath "After.cs") -Value $afterContent
        Set-Content -Path (Join-Path $projectPath "Real.cs") -Value $realContent
    } else {
        # Default template if not found
        $defaultContent = @"
namespace $projectName
{
    public class {0}
    {
        // TODO: Implement {0} logic
    }
}
"@
        Set-Content -Path (Join-Path $projectPath "Before.cs") -Value ($defaultContent -f "Before")
        Set-Content -Path (Join-Path $projectPath "After.cs") -Value ($defaultContent -f "After")
        Set-Content -Path (Join-Path $projectPath "Real.cs") -Value ($defaultContent -f "Real")
    }

    # Create Program.cs
    $programContent = @"
namespace $projectName
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("$projectName");
            Console.WriteLine("=".PadRight(50, '='));
            Console.WriteLine("Demonstrating: $($pattern.Pattern)");
        }
    }
}
"@

    Set-Content -Path (Join-Path $projectPath "Program.cs") -Value $programContent

    $createdCount++
    Write-Host "? Created project: $projectName" -ForegroundColor Green
}

Write-Host "`n" -ForegroundColor White
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "========" -ForegroundColor Cyan
Write-Host "Total patterns to create: $($refactoringPatterns.Count)" -ForegroundColor White
Write-Host "Newly created: $createdCount" -ForegroundColor Green
Write-Host "Already existing: $existingCount" -ForegroundColor Yellow

Write-Host "`nAdding projects to solution..." -ForegroundColor Cyan

$addedCount = 0
$failedCount = 0

foreach ($pattern in $refactoringPatterns) {
    $projectName = $pattern.ProjectName
    $projectPath = Join-Path $solutionDir $projectName
    $csprojFile = Join-Path $projectPath "$projectName.csproj"

    if (Test-Path $csprojFile) {
        # Check if already in solution
        $slnContent = Get-Content $solutionFile -Raw
        if ($slnContent -like "*$projectName*") {
            Write-Host "  ? $projectName already in solution" -ForegroundColor Gray
        } else {
            & dotnet sln $solutionFile add $csprojFile 2>&1 | Out-Null
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  ? Added to solution: $projectName" -ForegroundColor Green
                $addedCount++
            } else {
                Write-Host "  ? Failed to add: $projectName" -ForegroundColor Red
                $failedCount++
            }
        }
    }
}

Write-Host "`nFinal Summary:" -ForegroundColor Cyan
Write-Host "==============" -ForegroundColor Cyan
Write-Host "Total projects in list: $($refactoringPatterns.Count)" -ForegroundColor White
Write-Host "Newly created: $createdCount" -ForegroundColor Green
Write-Host "Already existed: $existingCount" -ForegroundColor Yellow
Write-Host "Added to solution: $addedCount" -ForegroundColor Green
Write-Host "Failed to add: $failedCount" -ForegroundColor Red

Write-Host "`nScript completed!" -ForegroundColor Green
Write-Host "Solution file: $solutionFile" -ForegroundColor Cyan
