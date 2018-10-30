TDT-convert instructions

Quick start

NB: the changes to the .m file described below can be done on any computer whether or not it has Matlab installed. You can open the .m file in any text editor (e.g. Notepad) and make the changes. If you have Matlab installed and want to edit from within Matlab&#39;s editor you can do this my typing _edit myproject\_convert_ at a Matlab prompt but the folder has to be on Matlab&#39;s path (see step 7 below).

1. Clone _tdt-convert_ from [https://github.com/mccutcheonlab/tdt-convert](https://github.com/mccutcheonlab/tdt-convert)

2. Copy _template\_convert.m_ to a master folder for the project (e.g. a location on the R drive where everything is stored, R:\DA\_and\_Reward\jem64\myproject\) and rename the .m file with a project-specific name (e.g. _myproject\_convert.m_).

3. Create metafile sheet in project&#39;s Excel experimental details file (see metafile instructions below).

4. Change value for folder in _myproject\_convert.m_ script to point to project master folder (can be edited in Matlab or another text editor such as Notepad).

5. Ensure TDT tanks are inside a folder named _tdtfiles in the folder from step 4._

6. Create a folder named _matfiles_ in the folder from step 4.

7. Add the _tdt-convert_ folder and the folder with _myproject\_convert.m_ (if different) to Matlab&#39;s path by clicking &#39;Set Path&#39; in the Matlab command ribbon.

8. Run _myproject\_convert.m_ by typing its name at the Matlab command prompt .

9. Check log file (_conversion\_log.txt_) in the _matfiles_ folder to see if any files failed the conversion process.

More information and detailed instructions

Make metafile in Excel file

An example metafile is included in the _tdt-convert_ folder named _example\_metafile.xlsx_. For your project this Excel file should be located in your master folder.

Setting up column headers

The metafile must have the following columns (spelled exactly as below):

_tdtfile_ – name of the TDT tank, not the entire path

_rat_ – named or ID of the rat, e.g. PPP1-1

_session_ – name of the session, could be s1, s2 etc or lick1, lick2 etc

_include-mat_ – 0 or 1 depending on if a file is to be included or not

In addition, there should be two columns for with the names of the stored streamed signals from Synapse named &#39;_sig-blue_&#39; and &#39;_sig-uv_&#39; and columns for any TTLs that you need to extract from Synapse which should be start with the prefix &#39;_ttl-_&#39;, e.g. _ttl-lick_ or _ttl-sipper_.

These values will differ for Box 1 and Box 2 and is how the conversion program knows which signals are matched up with each rat.

As many additional columns as you want can be included, for example, you may need these for further analysis using Python. These columns can be interspersed with the required columns as is shown on the example.

After the header is set up, data can be added to the columns. Entries for the sig- and ttl- columns need to correspond to the names for streamed signals and TTLs that Synapse uses.

Detail on the project-specific conversion script (e.g. _myproject\_covert.m_)

This is the main Matlab script that you will run for each project and should be the only thing that needs creating/editing. There is an example version in the _tdt-convert_ repository (named _template\_convert.m_).

_folder_ – This should be the master folder, often kept on the R drive, although it could be a local folder on a hard drive or USB stick. It should include the following subfolders:

_tdtfiles_ – this folder is where you should put all the tanks that will be read and processed

_matfiles –_ you need to create this empty folde, which is the location where the .mat filses that are produced will be saved.

_skipfiles_ – default is 1, which will result in the script skipping over files that have already been converted

_processfiles_ – this setting can be ignored at present.

_xlfile –_ name of Excel file that contains metafile sheet. Needs to be in _folder._

_sheet_ – name of sheet in _xlfile_ with metafile data.

Running



Make metafile

Metafile should