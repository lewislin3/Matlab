#include "mex.h"
#include "matrix.h"

void lab12c(double *A, double *B, int *C, int n1, int n2){
    int i,j;
    for (i=0; i!=n1; i++){
        for (j=0; j!=n2/2; j++){
            C[i]=0;
            if(A[i]>=B[j] && A[i]<B[j+n2/2]){
                C[i]=j+1;
                break;
            }
        }
        
    
    }
    

}

void mexFunction(int nlhs, mxArray *plhs[],int nrhs, const mxArray *prhs[]){
     
    /* input A */
    double *A = mxGetPr(prhs[0]); //* pointer to the array content of A
    int n1 = mxGetNumberOfElements(prhs[0]); // # elements
    mwSize ndim1 = mxGetNumberOfDimensions(prhs[0]); // # dimensions
    const mwSize *dims1 = mxGetDimensions(prhs[0]); // sizes of the dimensions

    /* input B */
    double *B = mxGetPr(prhs[1]); //* pointer to the array content of B
    int n2 = mxGetNumberOfElements(prhs[1]); // # elements
    mwSize ndim2 = mxGetNumberOfDimensions(prhs[1]); // # dimensions
    const mwSize *dims2 = mxGetDimensions(prhs[1]); // sizes of the dimensions

    /* output C */
    plhs[0] = mxCreateNumericArray(ndim1, dims1, mxINT32_CLASS, mxREAL);
    double *C = mxGetPr(plhs[0]); //* pointer to the array content of C

    /* actual processing */
    lab12c(A, B, C, n1, n2);

   }