import React from 'react'
import Product from './Product'

function Products() {
  return (
    <div className='grid grid-cols-4 w-full gap-[5%] py-5 h-[50%]'>
      <Product />
      <Product />
      <Product />
      <Product />
      <Product />
    </div>
  )
}

export default Products