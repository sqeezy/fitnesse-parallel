using System;

namespace AdapterLib
{
    public class Adapter
    {
        public double A {get;set;}
        public double B {get;set;}

        public double Mul => A * B;
        public double Add => A + B;
        public double Sub => A - B;
        public double Div => A / B;
    }
}
