using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;

namespace UnpredictableCrash
{
	class Program
	{
		//This program pretends to do some work and then crashes.
		//It simulates a broken program that may exit unexpectedly.
		static void Main(string[] args)
		{
			//sleep for 1 second
			Thread.Sleep(1000);
			//Then exit as if the program crashed
		}
	}
}
