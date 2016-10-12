using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Threading;

namespace MemoryHog
{
	class Program
	{
		//This program simulates a broken application that leaks memory.
		//It will allocate 2MB chunks of memory every second.
		static void Main(string[] args)
		{
			ArrayList largeCollection = new ArrayList();
			while (true)
			{
				//allocate a 2MB string object
				string largeString = new string('a', 1024 * 1024);
				largeCollection.Add(largeString);

				Thread.Sleep(1000);
			}
		}
	}
}
