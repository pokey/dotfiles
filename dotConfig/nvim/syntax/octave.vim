" Vim syntax file
" Language:	Octave
" Maintainer:	Claudio Fleiner <vim@fleiner.com>
" Last Change:	
" Adapted from the matlab file

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword octaveStatement		return break continue
syn keyword octaveLabel			case switch endswitch
syn keyword octaveConditional		else elseif end if endif otherwise
syn keyword octaveRepeat		do for while endwhile until endfor 
syn keyword octaveException             unwind_protect unwind_protect_cleanup end_unwind_protect try catch end_try_catch
syn keyword octaveFuncDef               function endfunction return 
syn keyword octaveCmd               	gplot gsplot global all_va_args

syn keyword octaveCmdFunction           casesen       echo          load          show
syn keyword octaveCmdFunction           cd            edit_history  ls            type
syn keyword octaveCmdFunction           chdir         format        more          which
syn keyword octaveCmdFunction           clear         help          run_history   who
syn keyword octaveCmdFunction           diary         history       save          whos
syn keyword octaveCmdFunction           dir           hold          set

syn keyword octaveTodo			contained  TODO

" If you do not want these operators lit, uncommment them and the "hi link" below
syn match octaveArithmeticOperator	"[-+]"
syn match octaveArithmeticOperator	"\.\=[*/\\^]"
syn match octaveRelationalOperator	"[=~]="
syn match octaveRelationalOperator	"[<>]=\="
syn match octaveLogicalOperator		"[&|~]"

syn match octaveLineContinuation	"\\$"

"syn match octaveIdentifier		"\<\a\w*\>"

" String
syn region octaveString			start=+'+ skip=+\\.+ end=+'+	oneline
syn region octaveString			start=+"+ skip=+\\.+ end=+"+	oneline

" If you don't like tabs
syn match octaveTab			"\t"

" Standard numbers
syn match octaveNumber		"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
syn match octaveFloat		"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match octaveFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

syn match octaveTransposeOperator	"[])a-zA-Z0-9.]'"lc=1

"syn match octaveSemicolon		";"

syn keyword octaveBoolean		true false

syn match octaveComment			"[#%].*$"	contains=octaveTodo,octaveTab

syn keyword octaveConstant		e eps i I inf Inf J j nan NaN pi realmax realmin

syn keyword octaveFunction 		abcddim abs acos acosh acot acsc acsch airy all analdemo angle anova any append arch_fit arch_rnd arch_test are arg arma_rnd asctime asec asech asin asinh atan atan2 atanh atexit autocor autocov autoreg_matrix axis axis2dlim
syn keyword octaveFunction              balance bar bartlett bartlett_test base2dec bddemo besselh besseli besselj besselk bessely beta beta_cdf betainc beta_inv beta_pdf beta_rnd bincoeff binomial_cdf binomial_inv binomial_pdf binomial_rnd blackman blanks bode bode_bounds bottom_title bug_report buildssic
syn keyword octaveFunction              c2d cauchy_cdf cauchy_inv cauchy_pdf cauchy_rnd cd ceil cell cellstr center char chdir chisquare_cdf chisquare_inv chisquare_pdf chisquare_rnd chisquare_test_homogeneity chisquare_test_independence chol clc clear clearplot clg clock cloglog closeplot colloc colormap columns com2str common_size commutation_matrix compan complement completion_matches computer cond conj contour conv cor corrcoef cor_test cos cosh cot coth cov cputime create_set cross csc csch ctime ctrb cumprod cumsum cut
syn keyword octaveFunction              d2c damp dare daspk daspk_options dasrt dasrt_options date dbclear dbstatus dbstop dbtype dbwhere dcgain deblank dec2base dec2bin dec2hex deconv DEMOcontrol det detrend dgkfdemo dgram diag diary diff discrete_cdf discrete_inv discrete_pdf discrete_rnd disp dkalman dlqe dlqr dlyap dmr2d dmult document do_string_escapes dot dre dup2 duplication_matrix durbinlevinson
syn keyword octaveFunction              echo edit_history eig empirical_cdf empirical_inv empirical_pdf empirical_rnd endgrent endpwent erf erfc erfinv error errorbar etime eval exec exist exit exp expm exponential_cdf exponential_inv exponential_pdf exponential_rnd eye
syn keyword octaveFunction              f_cdf fclose fcntl fdisp feof ferror feval fflush fft fft2 fftconv fftfilt fftn fftshift fgetl fgets fieldnames figure file_in_loadpath file_in_path filter find findstr finite f_inv fir2sys fix fliplr flipud floor fnmatch foo fopen fork format f_pdf fprintf fputs fractdiff frdemo fread freport freqchkw freqz frewind f_rnd fscanf fseek fsolve fsolve_options ftell f_test_regression fv fvl fwrite
syn keyword octaveFunction              gamma gamma_cdf gammainc gamma_inv gammaln gamma_pdf gamma_rnd gcd geometric_cdf geometric_inv geometric_pdf geometric_rnd getegid getenv geteuid getgid getgrent getgrgid getgrnam getpgrp getpid getppid getpwent getpwnam getpwuid getrusage getuid givens glob gls gmtime gplot gram graw gray gray2ind grid gset gshow gsplot
syn keyword octaveFunction              h2norm hamming hankel hanning help hess hex2dec hilb hinf_ctr hinfdemo hinfnorm hinfsyn hinfsyn_chk hinfsyn_ric hist history hold home hotelling_test hotelling_test_2 housh hurst hypergeometric_cdf hypergeometric_inv hypergeometric_pdf hypergeometric_rnd
syn keyword octaveFunction              ifft ifftn imag image imagesc impulse imshow ind2gray ind2rgb index input int2str intersection inv inverse invhilb iqr irr is_abcd isalnum isalpha isascii isbool iscell ischar iscntrl iscomplex is_controllable is_detectable is_dgkf isdigit is_digital is_duplicate_entry isempty isfield isglobal isgraph ishold isieee isinf is_leap_year isletter islist islower ismatrix isna isnan is_nan_or_na isnumeric is_observable isprint ispunct isreal is_sample isscalar is_signal_list is_siso isspace issquare is_stable isstr isstream isstruct issymmetric isupper isvector isxdigit
syn keyword octaveFunction              jet707
syn keyword octaveFunction              kbhit kendall keyboard kolmogorov_smirnov_cdf kolmogorov_smirnov_test kolmogorov_smirnov_test_2 kron kruskal_wallis_test krylov kurtosis
syn keyword octaveFunction              laplace_cdf laplace_inv laplace_pdf laplace_rnd lasterr lastwarn lcm length lgamma lin2mu link linspace list load loadaudio loadimage localtime log log10 log2 logistic_cdf logistic_inv logistic_pdf logistic_regression logistic_rnd logit loglog loglogerr logm lognormal_cdf lognormal_inv lognormal_pdf lognormal_rnd logspace lqe lqg lqr ls lsim lsode lsode_options lstat ltifr lu lyap
syn keyword octaveFunction              mahalanobis manova max mcnemar_test mean meansq median menu mesh meshdom meshgrid min mkdir mkfifo mktime mod moddemo moment more mplot mu2lin multiplot
syn keyword octaveFunction              nargchk nargin nargout newtroot nextpow2 norm normal_cdf normal_inv normal_pdf normal_rnd nper npv nth ntsc2rgb null num2str nyquist
syn keyword octaveFunction              obsv ocean octave_config_info odessa odessa_options ols oneplot ones ord2 orth
syn keyword octaveFunction              parallel pascal_cdf pascal_inv pascal_pdf pascal_rnd pause pclose periodogram perror pinv pipe place playaudio plot plot_border pmt poisson_cdf poisson_inv poisson_pdf poisson_rnd polar poly polyderiv polyfit polyinteg polyreduce polyval polyvalm popen popen2 postpad pow2 ppplot prepad printf probit prod prompt prop_test_2 purge_tmp_files putenv puts pv pvl pwd pzmap
syn keyword octaveFunction              qconj qcoordinate_plot qderiv qderivmat qinv qmult qqplot qr qtrans qtransv qtransvmat quad quad_options quaternion quit qz qzhess qzval
syn keyword octaveFunction              syn keyword octaveFunction rand randn randperm range rank ranks rate readdir readlink read_readline_init_file real record rectangle_lw rectangle_sw rehash rem rename replot repmat reshape residue reverse rgb2ind rgb2ntsc rindex rldemo rlocus rmdir roots rot90 round rows run_count run_history run_test
syn keyword octaveFunction              save saveaudio saveimage schur sec sech semilogx semilogxerr semilogy semilogyerr set setgrent setpwent shg shift show sign sign_test sin sinc sinetone sinewave sinh size skewness sleep sort sortcom source spearman spectral_adf spectral_xdf spencer splice split sprintf sqrt sqrtm ss ss2tf ss2zp sscanf stairs starp stat statistics std stdnormal_cdf stdnormal_inv stdnormal_pdf stdnormal_rnd step str2mat str2num strcat strcmp strerror strftime strjust strptime strrep studentize subplot substr subwindow sum sumsq svd syl sylvester_matrix symlink synthesis sys2fir sys2ss sys2tf sys2zp sysadd sysappend syschnames syschtsam sysconnect syscont sysdimensions sysdisc sysdup sysgetsignals sysgettsam sysgettype sysgroup sysmin sysmult sysout sysprune sysreorder sysrepdemo sysscale syssetsignals syssub system sysupdate
syn keyword octaveFunction              table tan tanh t_cdf tf2ss tf2sys tf2zp tfout tic tilde_expand time t_inv title tmpfile tmpnam toascii toc toeplitz tolower top_title toupper t_pdf trace triangle_lw triangle_sw tril triu t_rnd t_test t_test_2 t_test_regression type typeinfo tzero tzero2
syn keyword octaveFunction              ugain umask undo_string_escapes uniform_cdf uniform_inv uniform_pdf uniform_rnd union unlink unwrap usage usleep u_test
syn keyword octaveFunction              values vander var var_test vec vech vol
syn keyword octaveFunction              waitpid warning weibull_cdf weibull_inv weibull_pdf weibull_rnd welch_test wgt1o which who whos wiener_rnd wilcoxon_test
syn keyword octaveFunction              xlabel xor
syn keyword octaveFunction              ylabel yulewalker
syn keyword octaveFunction              zeros zgfmul zgfslv zginit zgreduce zgrownorm zgscal zgsgiv zgshsr zlabel zp2ss zp2sys zp2tf zpout z_test z_test_2

syn match octaveError	"-\=\<\d\+\.\d\+\.[^*/\\^]"
syn match octaveError	"-\=\<\d\+\.\d\+[eEdD][-+]\=\d\+\.\([^*/\\^]\)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_octave_syntax_inits")
  if version < 508
    let did_octave_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink octaveTransposeOperator	octaveOperator
  HiLink octaveOperator		Operator
  HiLink octaveLineContinuation	Special
  HiLink octaveLabel			Label
  HiLink octaveConditional		Conditional
  HiLink octaveRepeat			Repeat
  HiLink octaveException		Exception
  HiLink octaveTodo			Todo
  HiLink octaveString			String
  HiLink octaveDelimiter		Identifier
  HiLink octaveTransposeOther		Identifier
  HiLink octaveNumber			Number
  HiLink octaveFloat			Float
  HiLink octaveFunction			Constant
  HiLink octaveFuncDef			Function
  HiLink octaveError			Error
  HiLink octaveImplicit		octaveStatement
  HiLink octaveBoolean			Boolean
  HiLink octaveStatement		Statement
  " HiLink octaveSemicolon		SpecialChar
  HiLink octaveComment			Comment

  " HiLink octaveArithmeticOperator	octaveOperator
  " HiLink octaveRelationalOperator	octaveOperator
  " HiLink octaveLogicalOperator		octaveOperator

"optional highlighting
  "HiLink octaveIdentifier		Identifier
  "HiLink octaveTab			Error

  delcommand HiLink
endif

let b:current_syntax = "octave"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
