subroutine allocate_vars()
!
! Allocate variables for the computation
!
 use mod_streams
 implicit none
!
#ifdef USE_CUDA
 allocate(w_gpu(nv,1-ng:nx+ng,1-ng:ny+ng,1-ng:nz+ng))
 allocate(fl_gpu(nv,nx,ny,nz))
 allocate(fln_gpu(nv,nx,ny,nz))
 allocate(temperature_gpu(1-ng:nx+ng,1-ng:ny+ng,1-ng:nz+ng))
 allocate(ducros_gpu(1-ng:nx+ng,1-ng:ny+ng,1-ng:nz+ng))
 allocate(wmean_gpu(nv,1-ng:nx+1+ng,ny))
 allocate(dcsidx_gpu(nx),dcsidx2_gpu(nx),dcsidxs_gpu(nx))
 allocate(detady_gpu(ny),detady2_gpu(ny),detadys_gpu(ny))
 allocate(dzitdz_gpu(nz),dzitdz2_gpu(nz),dzitdzs_gpu(nz))
 allocate(x_gpu(1-ng:nx+ng))
 allocate(y_gpu(1-ng:ny+ng))
 allocate(yn_gpu(1:ny+1))
 allocate(z_gpu(1-ng:nz+ng))
 allocate(xg_gpu(1-ng:nxmax+ng+1))
 allocate(coeff_deriv1_gpu(3))
 allocate(coeff_clap_gpu(0:3))
 allocate(fhat_gpu(6,1-ng:nx+ng,1-ng:ny+ng,1-ng:nz+ng))
 allocate(ibcnr_gpu(6))
 allocate(dcoe_gpu(4,4))
 allocate(winf_gpu(nv),winf1_gpu(nv))
 allocate(rf_gpu(3,1-nfmax:ny+nfmax,1-nfmax:nz+nfmax))
 allocate(rfy_gpu(3,ny,1-nfmax:nz+nfmax))
 allocate(vf_df_gpu(3,ny,nz))
 allocate(by_df_gpu(3,ny,-nfmax:nfmax))
 allocate(bz_df_gpu(3,ny,-nfmax:nfmax))
 allocate(amat_df_gpu(3,3,ny))
#endif
!
 allocate(wbuf1s_gpu(nv,ng,ny,nz))  
 allocate(wbuf2s_gpu(nv,ng,ny,nz))  
 allocate(wbuf3s_gpu(nv,nx,ng,nz))  
 allocate(wbuf4s_gpu(nv,nx,ng,nz))  
 allocate(wbuf5s_gpu(nv,nx,ny,ng))  
 allocate(wbuf6s_gpu(nv,nx,ny,ng))  
 allocate(wbuf1r_gpu(nv,ng,ny,nz))  
 allocate(wbuf2r_gpu(nv,ng,ny,nz))  
 allocate(wbuf3r_gpu(nv,nx,ng,nz))  
 allocate(wbuf4r_gpu(nv,nx,ng,nz))  
 allocate(wbuf5r_gpu(nv,nx,ny,ng))  
 allocate(wbuf6r_gpu(nv,nx,ny,ng))  
 allocate(divbuf1s_gpu(ng,ny,nz))  
 allocate(divbuf2s_gpu(ng,ny,nz))  
 allocate(divbuf3s_gpu(nx,ng,nz))  
 allocate(divbuf4s_gpu(nx,ng,nz))  
 allocate(divbuf5s_gpu(nx,ny,ng))  
 allocate(divbuf6s_gpu(nx,ny,ng))  
 allocate(divbuf1r_gpu(ng,ny,nz))  
 allocate(divbuf2r_gpu(ng,ny,nz))  
 allocate(divbuf3r_gpu(nx,ng,nz))  
 allocate(divbuf4r_gpu(nx,ng,nz))  
 allocate(divbuf5r_gpu(nx,ny,ng))  
 allocate(divbuf6r_gpu(nx,ny,ng))  
 allocate(ducbuf1s_gpu(ng,ny,nz))
 allocate(ducbuf2s_gpu(ng,ny,nz))
 allocate(ducbuf3s_gpu(nx,ng,nz))
 allocate(ducbuf4s_gpu(nx,ng,nz))
 allocate(ducbuf5s_gpu(nx,ny,ng))
 allocate(ducbuf6s_gpu(nx,ny,ng))
 allocate(ducbuf1r_gpu(ng,ny,nz))
 allocate(ducbuf2r_gpu(ng,ny,nz))
 allocate(ducbuf3r_gpu(nx,ng,nz))
 allocate(ducbuf4r_gpu(nx,ng,nz))
 allocate(ducbuf5r_gpu(nx,ny,ng))
 allocate(ducbuf6r_gpu(nx,ny,ng))
!
 allocate(w(nv,1-ng:nx+ng,1-ng:ny+ng,1-ng:nz+ng))
 allocate(fl(nv,nx,ny,nz))
 allocate(fln(nv,nx,ny,nz))
 allocate(temperature(1-ng:nx+ng,1-ng:ny+ng,1-ng:nz+ng))
 allocate(ducros(1-ng:nx+ng,1-ng:ny+ng,1-ng:nz+ng))
 allocate(wmean(nv,1-ng:nx+1+ng,ny))
 allocate(dcsidx(nx),dcsidx2(nx),dcsidxs(nx))
 allocate(detady(ny),detady2(ny),detadys(ny))
 allocate(dzitdz(nz),dzitdz2(nz),dzitdzs(nz))
 allocate(x(1-ng:nx+ng))
 allocate(y(1-ng:ny+ng))
 allocate(yn(1:ny+1))
 allocate(z(1-ng:nz+ng))
 allocate(xg(1-ng:nxmax+ng+1))
 allocate(coeff_deriv1(3))
 allocate(coeff_clap(0:3))
 allocate(fhat(6,1-ng:nx+ng,1-ng:ny+ng,1-ng:nz+ng)) ! Size increased to exchange divergence
 allocate(ibcnr(6))
 allocate(dcoe(4,4))
 allocate(winf(nv),winf1(nv))
 allocate(rf(3,1-nfmax:ny+nfmax,1-nfmax:nz+nfmax))
 allocate(rfy(3,ny,1-nfmax:nz+nfmax))
 allocate(vf_df(3,ny,nz))
 allocate(by_df(3,ny,-nfmax:nfmax))
 allocate(bz_df(3,ny,-nfmax:nfmax))
 allocate(amat_df(3,3,ny))
!
 allocate(ibc(6))
 allocate(dxg(nxmax))
 allocate(dyg(nymax))
 allocate(dzg(nzmax))
 allocate(w_av(nvmean,nx,ny))
 allocate(w_avzg(nvmean,nx,ny))
 allocate(w_av_1d(nvmean,ny))
 allocate(w_avxzg(nvmean,ny))
 allocate(bx_df(3,nxmax,-nfmax:nfmax))
 allocate(wbuf1s(nv,ng,ny,nz))  
 allocate(wbuf2s(nv,ng,ny,nz))  
 allocate(wbuf3s(nv,nx,ng,nz))  
 allocate(wbuf4s(nv,nx,ng,nz))  
 allocate(wbuf5s(nv,nx,ny,ng))  
 allocate(wbuf6s(nv,nx,ny,ng))  
 allocate(wbuf1r(nv,ng,ny,nz))  
 allocate(wbuf2r(nv,ng,ny,nz))  
 allocate(wbuf3r(nv,nx,ng,nz))  
 allocate(wbuf4r(nv,nx,ng,nz))  
 allocate(wbuf5r(nv,nx,ny,ng))  
 allocate(wbuf6r(nv,nx,ny,ng))  
 allocate(divbuf1s(ng,ny,nz))  
 allocate(divbuf2s(ng,ny,nz))  
 allocate(divbuf3s(nx,ng,nz))  
 allocate(divbuf4s(nx,ng,nz))  
 allocate(divbuf5s(nx,ny,ng))  
 allocate(divbuf6s(nx,ny,ng))  
 allocate(divbuf1r(ng,ny,nz))  
 allocate(divbuf2r(ng,ny,nz))  
 allocate(divbuf3r(nx,ng,nz))  
 allocate(divbuf4r(nx,ng,nz))  
 allocate(divbuf5r(nx,ny,ng))  
 allocate(divbuf6r(nx,ny,ng))  
 allocate(ducbuf1s(ng,ny,nz))
 allocate(ducbuf2s(ng,ny,nz))
 allocate(ducbuf3s(nx,ng,nz))
 allocate(ducbuf4s(nx,ng,nz))
 allocate(ducbuf5s(nx,ny,ng))
 allocate(ducbuf6s(nx,ny,ng))
 allocate(ducbuf1r(ng,ny,nz))
 allocate(ducbuf2r(ng,ny,nz))
 allocate(ducbuf3r(nx,ng,nz))
 allocate(ducbuf4r(nx,ng,nz))
 allocate(ducbuf5r(nx,ny,ng))
 allocate(ducbuf6r(nx,ny,ng))
 allocate(yg(1-ng:nymax+ng  ))
 allocate(zg(1-ng:nzmax+ng  ))
!
endsubroutine allocate_vars

subroutine copy_cpu_to_gpu()
!
 use mod_streams
 implicit none
!
#ifdef USE_CUDA
 w_gpu            = w
!fl_gpu           = fl
!fln_gpu          = fln
!temperature_gpu  = temperature
 ducros_gpu       = ducros
 wmean_gpu        = wmean
 dcsidx_gpu       = dcsidx      
 dcsidx2_gpu      = dcsidx2      
 dcsidxs_gpu      = dcsidxs     
 detady_gpu       = detady      
 detady2_gpu      = detady2     
 detadys_gpu      = detadys     
 dzitdz_gpu       = dzitdz      
 dzitdz2_gpu      = dzitdz2     
 dzitdzs_gpu      = dzitdzs     
 x_gpu            = x
 y_gpu            = y
 yn_gpu           = yn
 z_gpu            = z
 xg_gpu           = xg
 coeff_deriv1_gpu = coeff_deriv1
 coeff_clap_gpu   = coeff_clap
!fhat_gpu         = fhat
 ibcnr_gpu        = ibcnr
 dcoe_gpu         = dcoe
 winf_gpu         = winf
 winf1_gpu        = winf1
!rf_gpu           = rf
!rfy_gpu          = rfy ! not needed
 vf_df_gpu        = vf_df
 by_df_gpu        = by_df
 bz_df_gpu        = bz_df
 amat_df_gpu      = amat_df
#else
 call move_alloc( w            , w_gpu           )
 call move_alloc( fl           , fl_gpu          )
 call move_alloc( fln          , fln_gpu         )
 call move_alloc( temperature  , temperature_gpu )
 call move_alloc( ducros       , ducros_gpu      )
 call move_alloc( wmean        , wmean_gpu       )
 call move_alloc( dcsidx       , dcsidx_gpu      )
 call move_alloc( dcsidx2      , dcsidx2_gpu     )
 call move_alloc( dcsidxs      , dcsidxs_gpu     )
 call move_alloc( detady       , detady_gpu      )
 call move_alloc( detady2      , detady2_gpu     )
 call move_alloc( detadys      , detadys_gpu     )
 call move_alloc( dzitdz       , dzitdz_gpu      )
 call move_alloc( dzitdz2      , dzitdz2_gpu     )
 call move_alloc( dzitdzs      , dzitdzs_gpu     )
 call move_alloc( x            , x_gpu           )
 call move_alloc( y            , y_gpu           )
 call move_alloc( yn           , yn_gpu          )
 call move_alloc( z            , z_gpu           )
 call move_alloc( xg           , xg_gpu          )
 call move_alloc( coeff_deriv1 , coeff_deriv1_gpu)
 call move_alloc( coeff_clap   , coeff_clap_gpu  )
 call move_alloc( fhat         , fhat_gpu        )
 call move_alloc( ibcnr        , ibcnr_gpu       )
 call move_alloc( dcoe         , dcoe_gpu        )
 call move_alloc( winf         , winf_gpu        )
 call move_alloc( winf1        , winf1_gpu       )
 call move_alloc( rf           , rf_gpu          )
 call move_alloc( rfy          , rfy_gpu         )
 call move_alloc( vf_df        , vf_df_gpu       )
 call move_alloc( by_df        , by_df_gpu       )
 call move_alloc( bz_df        , bz_df_gpu       )
 call move_alloc( amat_df      , amat_df_gpu     )
#endif
end subroutine copy_cpu_to_gpu

subroutine copy_gpu_to_cpu
!
 use mod_streams
 implicit none
!
#ifdef USE_CUDA
 w = w_gpu
 temperature = temperature_gpu
 vf_df = vf_df_gpu
#else
 call move_alloc(w_gpu, w)
 call move_alloc(temperature_gpu , temperature)
 call move_alloc(vf_df_gpu , vf_df)
 call move_alloc(x_gpu , x)
 call move_alloc(xg_gpu,xg)
 call move_alloc(y_gpu , y)
 call move_alloc(z_gpu , z)
#endif
end subroutine copy_gpu_to_cpu

subroutine reset_cpu_gpu
!
 use mod_streams
 implicit none
!
#ifdef USE_CUDA
#else
 call move_alloc(w, w_gpu)
 call move_alloc(temperature, temperature_gpu)
 call move_alloc(vf_df, vf_df_gpu)
 call move_alloc(x , x_gpu)
 call move_alloc(xg,xg_gpu)
 call move_alloc(y , y_gpu)
 call move_alloc(z , z_gpu)
#endif
end subroutine reset_cpu_gpu