function [rhoP,pvalP,rhoS,pvalS,rhoK,pvalK]=CorrePKS(x,y)
[rhoP,pvalP]=corr(x,y,'type','pearson');
[rhoS,pvalS]=corr(x,y,'type','spearman');
[rhoK,pvalK]=corr(x,y,'type','kendall');
end