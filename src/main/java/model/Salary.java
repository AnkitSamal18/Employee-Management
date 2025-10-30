package model;

public class Salary {
    private int id;
    private int empId;
    private double basicSalary;
    private double bonus;
    private double deductions;
    private String month;
    private double netSalary;

    public Salary() {}

    public Salary(int id, int empId, double basicSalary, double bonus, double deductions, String month, double netSalary) {
        this.id = id;
        this.empId = empId;
        this.basicSalary = basicSalary;
        this.bonus = bonus;
        this.deductions = deductions;
        this.month = month;
        this.netSalary = netSalary;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getEmpId() { return empId; }
    public void setEmpId(int empId) { this.empId = empId; }

    public double getBasicSalary() { return basicSalary; }
    public void setBasicSalary(double basicSalary) { this.basicSalary = basicSalary; }

    public double getBonus() { return bonus; }
    public void setBonus(double bonus) { this.bonus = bonus; }

    public double getDeductions() { return deductions; }
    public void setDeductions(double deductions) { this.deductions = deductions; }

    public String getMonth() { return month; }
    public void setMonth(String month) { this.month = month; }

    public double getNetSalary() { return netSalary; }
    public void setNetSalary(double netSalary) { this.netSalary = netSalary; }
}
