function dirs = stringdir( name )
%STRINGDIR Returns the string output of dir
%  
% NAME can include a relative path, but the relative path must be in the 
% current folder. Otherwise, NAME must include a full path.
% 
% To list files and folders at a remote location, NAME must contain a
% full path specified as a uniform resource locator (URL).
%  
% Pathnames and asterisk wildcards may be used in NAME. A single asterisk
% in the path touching only file separators will represent exactly one
% folder name. A single asterisk at the end of an input will represent
% any filename. An asterisk followed or preceded by characters will
% resolve to zero or more characters. A double asterisk can only be used
% in the path and will represent zero or more folder names. It cannot
% touch a character other than a file separator. For example, dir *.m
% lists all files with a .m extension in the current folder. dir */*.m
% lists all files with a .m extension exactly one folder under the
% current folder. dir **/*.m lists all files with a .m extension zero or
% more folders under the current folder.
%  
% D = stringdir('NAME') returns the results in an M-by-1
% structure with the fields: 
%     name        -- Filename (string)
%     folder      -- Absolute path (string)
%     date        -- Modification date (datetime)
%     bytes       -- Number of bytes allocated to the file
%     isdir       -- true if name is a folder and false if not
%     datenum     -- Modification date as a MATLAB serial date number.
%                    This value is locale-dependent.

arguments
    name {mustBeNonzeroLengthText} = '.'
end

if nargout == 0
    dir(name)
    return
end
dirs = dir(name);

for i = 1:numel(dirs)
    dirs(i).name = string({dirs(i).name});
    dirs(i).folder = string({dirs(i).folder});
    dirs(i).date = datetime({dirs(i).date});
end


end
