# This file defines the CudaMat class overloading the ordinary arrays and dispatching to C/Cuda funtions

# as the number of dimensions will not change we rather parameterize the class CudaMat with number of dimensions N
# This should lead to best consitency with Julia and also to faster and less involved code.
type CudaMat{N} <: Array{Float32,N}
        ref::Cint
        internal_ref::Array{Float32,N}
        function CudaMat(anArray)
                finalizer(ref, deleteref)
        end
end

        type JavaObject{T}
                ptr::Ptr{Void}

                function JavaObject(ptr)
                        j=new(ptr)
                        finalizer(j, deleteref)
                        return j
                end

                JavaObject(argtypes::Tuple, args...) = jnew(T, argtypes, args...)

        end

