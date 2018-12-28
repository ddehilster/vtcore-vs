// nlppp.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "nlp.h"
#include "lite/inline.h"

#include <iostream>
#include <io.h>
#include <fcntl.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// The one and only application object

CWinApp theApp;

using namespace std;

bool cmdReadargs(int, _TCHAR*argv[],
	/*UP*/_TCHAR*&, _TCHAR*&, bool&, bool&, bool&);
void cmdHelpargs(_TCHAR*);

int _tmain(
	int argc,
	_TCHAR *argv[],
	_TCHAR *envp[]
	)
{
	_setmode(_fileno(stdout), _O_U16TEXT);

    int nRetCode = 0;

    HMODULE hModule = ::GetModuleHandle(nullptr);

    if (hModule != nullptr)
    {
        // initialize MFC and print and error on failure
        if (!AfxWinInit(hModule, nullptr, ::GetCommandLine(), 0))
        {
            // TODO: change error code to suit your needs
            wprintf(L"Fatal Error: MFC initialization failed\n");
            nRetCode = 1;
        }
        else
        {
			bool developed = false;
			bool compiled = false;
			bool silent = false;
			_TCHAR *input;
			_TCHAR *output;
			if (!cmdReadargs(argc, argv, input, output, silent, silent, silent)) //input,output,develop,compiled,silent))
			   exit(1);
        }
    }
    else
    {
        // TODO: change error code to suit your needs
        wprintf(L"Fatal Error: GetModuleHandle failed\n");
        nRetCode = 1;
    }

    return nRetCode;
}

/********************************************
* FN:		CMDREADARGS
* CR:		11/30/98 AM.
* SUBJ:	Get command line arguments.
* RET:	True if ok read, else false if failed.
* NOTE:	06/16/02 AM. Renamed from dosReadargs, moved to user project.
********************************************/

bool cmdReadargs(
	int argc,
	_TCHAR *argv[],
	/*UP*/
	_TCHAR* &input,				// Input file from args.
	_TCHAR* &output,			// Output file from args.
	bool &develop,				// Development mode (output intermediate files).
	bool &compiled,				// true - compiled ana. false=interp(DEFAULT).
	bool &silent				// true == only output files specified by analyzer.
	)
{
	_TCHAR *ptr;
	_TCHAR **parg;
	bool f_in = false;
	bool f_out = false;
	bool flag = false;
	bool compiledck = false;	// If compiled/interp arg seen.

	input = output = 0;
	develop = false;				// Default is not development mode.
	compiled = false;	// INTERP ANALYZER BY DEFAULT
	silent = false;	// Produce debug files, etc. by default.		// 06/16/02 AM.

	for (--argc, parg = &(argv[1]); argc > 0; --argc, ++parg)
	{
		// For each command line argument.
		//*gout << "command arg=" << *parg << endl;
		ptr = *parg;
		if (*ptr == '/' || *ptr == '-')	// DOS or UNIX style arg.
		{
			if (flag)
			{
				_t_cerr << _T("[Error in command line args for ") << argv[0]
					<< _T("]") << endl;
				return false;
			}
			++ptr;
			if (!strcmp_i(ptr, _T("in")))
				f_in = flag = true;					// Expecting input file.
			else if (!strcmp_i(ptr, _T("out")))
				f_out = flag = true;					// Expecting output file.
			else if (!strcmp_i(ptr, _T("dev")))		// 12/25/98 AM.
			{
				if (silent)
				{
					_t_cerr << _T("[Ignoring /dev flag.]") << endl;
					develop = false;
				}
				else
					develop = true;					// Development mode.
			}
			else if (!strcmp_i(ptr, _T("silent")))	                     // 06/16/02 AM.
			{
				if (develop)
				{
					_t_cerr << _T("[Ignoring /dev flag.]") << endl;
					develop = false;
				}
				silent = true;                                        // 06/16/02 AM.
			}
			else if (!strcmp_i(ptr, _T("interp")))	// Run interpreted analyzer.
			{
				if (compiledck)
					_t_cerr << _T("[Ignoring extra /compiled or /interp flag.]") << endl;
				else
				{
					compiledck = true;
					compiled = false;
				}
			}
			else if (!strcmp_i(ptr, _T("compiled")))	// Run compiled analyzer.
			{
				if (compiledck)
					_t_cerr << _T("[Ignoring extra /compiled or /interp flag.]") << endl;
				else
				{
					compiledck = true;
					compiled = true;
				}
			}
		}
		else if (flag)							// Expected an argument value.
		{
			if (f_in)
			{
				if (input)
				{
					_t_cerr << _T("[") << argv[0] << _T(": Input file specified twice.]")
						<< endl;
					cmdHelpargs(argv[0]);
					return false;
				}
				// Grab value as input file.
				input = ptr;
				f_in = flag = false;
			}
			else if (f_out)
			{
				if (output)
				{
					_t_cerr << _T("[") << argv[0]
						<< _T(": Output file specified twice.]") << endl;
					cmdHelpargs(argv[0]);
					return false;
				}
				// Grab value as output file.
				output = ptr;
				f_out = flag = false;
			}
		}
		else										// Got a "floating" value.
		{
			if (input && output)
			{
				_t_cerr << _T("[") << argv[0] << _T(": Extra arguments.]") << endl;
				cmdHelpargs(argv[0]);
				return false;
			}
			else if (input)
				output = ptr;
			else
				input = ptr;
		}
	}
	return true;
}

/********************************************
* FN:		CMDHELPARGS
* CR:		11/30/98 AM.
* SUBJ:	Print command line argument help.
* RET:	True if ok read, else false if failed.
* NOTE:	06/16/02 AM. Renamed from dosHelpargs, moved to user project.
********************************************/

void cmdHelpargs(_TCHAR *name)
{
	_t_cout << name
		<< _T(" [/INTERP][/COMPILED][/IN infile] [/OUT outfile] [/DEV][/SILENT] [infile [outfile]]")
		<< endl
		<< _T("Note: /INTERP, the interpreted analyzer, is default.")
		<< endl;
}
