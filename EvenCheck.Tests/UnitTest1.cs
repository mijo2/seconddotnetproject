using System;
using Xunit;
using EvenCheck;

namespace EvenCheck.Tests
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            Assert.True(IsEven.check(2));
            Assert.False(IsEven.check(1)); 
        }
    }
}
