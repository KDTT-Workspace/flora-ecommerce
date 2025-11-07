import React from 'react'
import Button from './Button'

const navItems = ["Trang chủ", "Kiểu dáng", "Khuyến mãi", "Hoa tươi", "Màu sắc"]
function Header() {
    return (
        <div>
            <div className='bg-[#ff9dce] flex items-center justify-around sticky h-[60px]'>
                <div>
                    Logo
                </div>

                <div>
                    <div>
                        <input className='bg-white p-0 rounded-4xl outline-none px-4 h-[30px] w-[400px]' type="text" placeholder='Searching...' />
                    </div>
                </div>

                <div>You</div>
            </div>
            <div className='flex flex-row justify-around bg-green-300 px-20'>
                {navItems.map((item, index) => (
                    <Button key={index} string={item} custom="bg-green-300 hover:text-white text-center" />
                ))}
            </div>
        </div>
    )
}

export default Header