import React from 'react'
import Menu from './Menu'
import Products from './Products'

function Main() {
  return (
    <div className='flex flex-row w-full gap-[10%] h-screen'>
        <div className='w-[10%]'><Menu /></div>
        <div className='w-2/3'>
          <Products/>
        </div>
    </div>
  )
}

export default Main